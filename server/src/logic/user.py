from config.config import *

import pymysql
import redis
from common.log import log
import time
import secrets
import string

#返回三种结果：
# None：redis执行报错
# "error": old_id错误
# session_id：成功，这个是新的session id，同时也意味着旧的失效
def create_session(id, old_id=None):
    try:        
        client_redis = redis.Redis(host=REDIS_CONF["host"], port=REDIS_CONF["port"], db=REDIS_CONF["db"])
        if old_id != None:
            #检查旧id是否正确
            r_old_id = client_redis.hget(id, "session_id").decode()
            if r_old_id != old_id:
                return "error"
        characters = string.ascii_letters + string.digits
        # 生成随机字符串
        session_id = ''.join(secrets.choice(characters) for _ in range(16))
        # 存入redis
        client_redis.hset(id, "session_id", session_id)
        # 返回session_id
        return session_id
    except:
        return None

def get_table(data_type):
    try:
        sql = f"select data_table from {TB_INDEX} where data_name = %s"
        print(data_type)
        mysql_cli = pymysql.connect(**MYSQL_CONF)
        cur = mysql_cli.cursor()
        cur.execute(sql, (data_type,))
        result = cur.fetchone()
        return result[0]
    except:
        return None

def id_exist(tb,id):
    try:
        sql = f'select id from {tb} where id=%s'
        mysql_cli = pymysql.connect(**MYSQL_CONF)
        cur = mysql_cli.cursor()
        ret = cur.execute(sql,(id,))
        if ret == None and len(ret) == 0:
            return False
        else:
            return True
    except Exception as e:
            log.error(e)
            return False
        

#格式检查
def check_username_or_password(data):
    if len(data) < 1 or len(data.encode("utf-8")) > 20:
        return False
    if data.find(';') != -1:
        return False
    return True
    

class Logon(object):
    def __init__(self) -> None:
        self.client_redis = redis.Redis(host=REDIS_CONF["host"], port=REDIS_CONF["port"], db=REDIS_CONF["db"])
        self.client_mysql = pymysql.connect(**MYSQL_CONF)
    def run(self, data):
        # 检查用户名和密码长度是否合法
        if not check_username_or_password(data["username"]) or not check_username_or_password(data["password"]):        
            return CODE_OK, {'success': False, 'id': "", "mess" : "username or password length error"}
        # 给用户申请一个id
        id = None
        beg_time = time.time()
        while id == None:
            if(time.time() - beg_time > 10):
                return CODE_OK, {'success': False, 'id': "", "mess" : "get id timeout"}
            id = self.get_id()
        # 创建用户信息
        success = self.create_user(id, data["username"], data["password"])
        if success:
            id = str(id)
            if len(id) < 8:
                id = "0"*(8-len(id)) + id
            response = {'success': True, 'id': id, "mess" : "create user success"}
            return CODE_OK, response
        else:
            response = {'success': False, 'id': "", "mess" : "create user fail"}
            return CODE_OK, response
        
    def get_id(self):
        if self.client_redis.set(f"id_lock", 1, nx=True, ex=1):
            try:
                id = self.client_redis.get(f"id")
                if id == None:
                    id = 1000000000
                id = int(id)
                self.client_redis.set(f"id", id+1)
                self.client_redis.delete("id_lock")
                return id
            except Exception as e:
                self.client_redis.delete("id_lock")
                log.error(f"Logon.get_id,erro_mess:{e}")
                return None
        else:
            return None

    def create_user(self, id, username, password):
        try:
            sql = f"insert into {TB_USER} (id, username, password) values (%s, %s, %s)"
            self.client_mysql.cursor().execute(sql, (id, username, password))
            self.client_mysql.commit()
            return True
        except Exception as e:
            log.error(f"Logon.create_user,erro_mess:{e}")
            return False


class Login(object):
    def __init__(self):
        self.client_redis = redis.Redis(host=REDIS_CONF["host"], port=REDIS_CONF["port"], db=REDIS_CONF["db"])
        self.client_mysql = pymysql.connect(**MYSQL_CONF)
        
    def run(self, data):
        id = data["id"]
        password = data["password"]
        #检查id和密码是否合法
        if not check_username_or_password(password):
            return CODE_OK, {'success': False, "mess" : "password format error"}
        try:
            id = int(data["id"])
        except:
            return CODE_OK, {'success': False, "mess" : "id error"}
        try:
            max_id = self.client_redis.get(f"id")
            max_id = int(max_id)
            if id > max_id:
                return CODE_OK, {'success': False, "mess" : "id error"}
        except:
            pass
        #检查id和密码是否匹配
        id_password = self.get_password(id)
        if id_password == None:
            return CODE_OK, {'success': False, "mess" : "id error"}
        elif id_password != password:
            return CODE_OK, {'success': False, "mess" : "password error"}
        return CODE_OK, {'success': True, "mess" : "login success"}
        
    def get_password(self,id):
        try:
            sql = f"select password from {TB_USER} where id = %s"
            cursor = self.client_mysql.cursor()
            cursor.execute(sql, (id,))
            result = cursor.fetchone()
            return result[0]
        except Exception as e:
            log.error(f"Login.get_password,erro_mess:{e}")
            return None
    
class Update(object):
    def __init__(self) -> None:
        self.client_mysql = pymysql.connect(**MYSQL_CONF)
    def run(self, data):
        # 检查请求是否出错
        if not self.check_request(data):
            return CODE_OK,{'success':False,"mess":"parameter error"}
        # 对请求进行处理，先检查旧数据是否正确，如果错误，不予许修改
        if not self.check_old_data():
            return CODE_OK,{'success':False,"mess":"old data is wrong"}

        # 更新操作
        if self.process():
            return CODE_OK,{'success':True,"mess":"update success"}
        else:
            return CODE_OK,{'success':False,"mess":"update failed"}
    
    def process(self):
        try:
            # 更改表中的数据
            for i in range(self.data_len):    
                # 如果数据本身不存在，直接插入，如果数据存在，修改
                d_type = self.data_type[i]
                d_table = self.search_obj.type_table_m[d_type]
                if not id_exist(d_table,self.id):
                    sql = f'insert into {d_table}(id, {d_type}) values(%s, %s)'
                    args = (self.id, self.new_data[i], )
                    cursor = self.client_mysql.cursor()
                    cursor.execute(sql,args)
                    self.client_mysql.commit()
                else:
                    sql = f'update {d_table} set {d_type}=%s where id=%s'
                    args = (self.new_data[i], self.id,)
                    cursor = self.client_mysql.cursor()
                    cursor.execute(sql,args)
                    self.client_mysql.commit()
            return True
                    
        except Exception as e:
            log.error(f'Update.process error:'+str(e))
            return False
        
    def check_request(self, data):
        self.id = data.get('id', '')
        self.data_type = data.get('data_type',[])
        self.old_data = data.get('old_data',[])
        self.new_data = data.get('new_data',[])
        if self.id=='' or self.data_type==[] or self.old_data==[] or self.new_data==[]:
            return False
        self.data_len = len(self.data_type)
        if self.data_len != len(self.old_data) or self.data_len != len(self.new_data):
            return False
        return True
    
    def check_old_data(self):
        search_old_data_request = {
            "Action" : "GetMessage",
            "id" : self.id,
            "data_type" : self.data_type,
        }
        self.search_obj = GetMessage()
        self.search_obj.root = True
        real_old_data = self.search_obj.run(search_old_data_request)[1]['data']
        for i in range(self.data_len):
            if real_old_data[i] != self.old_data[i]:
                return False
        return True
        
        
class GetMessage(object):
    def __init__(self) -> None:
        self.client_mysql = pymysql.connect(**MYSQL_CONF)
        self.root = False
    def run(self, data):
        # 查询信息所在的表
        data_types = data.get("data_type",[])
        id = data.get("id",None)
        if id == None:
            return CODE_OK, {'success': False, "mess" : "id empty"}
        if data_types == []:
            return CODE_OK, {'success': False, "mess" : "data_type empty"}
        
        #如果没有权限，那么不允许查询密码
        if not self.root and "password" in data_types:
            return CODE_OK, {'success": False, "mess" : "no permission'}
        
        self.type_table_m = {}
        for data_type in data_types:
            data_table = None
            st_time = time.time()
            while data_table == None and time.time() - st_time <= 5:
                data_table = get_table(data_type)
            self.type_table_m[data_type] = data_table
        # 从表中查询信息
        result_list = []
        for data_type, data_table in self.type_table_m.items():
            res = None
            if data_table == None:
                result_list.append(None)
                continue
            st_time = time.time()
            while time.time() - st_time <= 5 and res == None:
                res = self.search_message(id, data_table, data_type)
            if res == 'NULL':
                result_list.append(None)
            else:
                result_list.append(res)
        # 返回信息
        ret = {
                "success" : True,
                "data_type" : data_types,
                "data" : result_list,
                "mess" : "get data success"
        }
        return CODE_OK, ret
                
    def search_message(self, id, data_table, data_type):
        try:
            #防一手sql注入
            if data_table.find(';') != -1 or data_type.find(';') != -1:
                return "error"
            sql = f"select {data_type} from {data_table} where id = %s"
            cursor = self.client_mysql.cursor()
            cursor.execute(sql, ( id,))
            result = cursor.fetchone()
            if len(result)== 0:
                return "NULL"
            return result[0]
        except:
            return None
        
        
        