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
        cur.execute(sql,(id,))
        ret = cur.fetchone()
        if len(ret) == 0:
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
    
create_sql_list = [
    'CREATE TABLE {user_id}_friend (id BIGINT PRIMARY KEY,status VARCHAR(10))',
    'CREATE TABLE {user_id}_group (group_id BIGINT PRIMARY KEY, identity SMALLINT)',
]

# 创建用户时调用
def create_others(id,cursor):
    for sql in create_sql_list:
        cursor.execute(sql.format(user_id=id))
    return True

# 返回：用户1视角中的关系，用户2视角中的关系
def get_relationship(user1_id,user2_id):
    try:
        sql = 'select status from {}_friend where id = %s'
        mysql_cli = pymysql.connect(**MYSQL_CONF)
        cur = mysql_cli.cursor()
        cur.execute(sql.format(user1_id),(user2_id,))
        result1 = cur.fetchone()
        if result1 == None:
            pass
        elif len(result1) > 0:
            result1 = result1[0]
        else:
            result1 = None
        cur.execute(sql.format(user2_id),(user1_id,))
        result2 = cur.fetchone()
        if result2 == None:
            pass
        elif len(result2) > 0:
            result2 = result2[0]
        else:
            result2 = None        
        return result1,result2
    except Exception as e:
            log.error(e)
            return None,None

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
            cursor = self.client_mysql.cursor()
            cursor.execute(sql, (id, username, password))
            create_others(id,cursor)
            self.client_mysql.commit()
            return True
        except Exception as e:
            self.client_mysql.rollback()
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
                else:
                    sql = f'update {d_table} set {d_type}=%s where id=%s'
                    args = (self.new_data[i], self.id,)
                    cursor = self.client_mysql.cursor()
                    cursor.execute(sql,args)
            self.client_mysql.commit()
            return True
                    
        except Exception as e:
            self.client_mysql.rollback()
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
        

class FriendList(object):
    def __init__(self)->None:
        self.mysql_cli = pymysql.connect(**MYSQL_CONF)
    
    def run(self,data):
        # 检查信息是否齐全
        self.data = data
        self.check_request()
        if not self.check_request():
            return CODE_OK,{'success' : False , "mess":"parameter incomplete"}
        
        # 判断用户是否存在
        if not id_exist(TB_USER, self.dest_id):
            return CODE_OK,{"success" : False,"mess":"Destination User does not existst"}
        
        # 执行添加或删除操作
        if self.process():
            return CODE_OK, {"success" : True, "mess":""}
        else:
            return CODE_OK, {"success" : False, "mess":""}
        
    def process(self):
        try:
            cursor = self.mysql_cli.cursor()
            if self.friendAction == 0:
                # 发起好友意向
                # 查询对方是否对自己有好友意向
                sql = f"SELECT status FROM `{self.id}_friend` WHERE id = {self.dest_id}" #这里直接嵌入是因为之前检查过两个id，不存在注入风险
                cursor.execute(sql)
                result = cursor.fetchone()
                if result != None and len(result) > 0:
                    result = result[0]
                if result == 'Request':
                    # 对方已经具备意向，修改这个状态为Intention即可
                    sql = f"UPDATE `{self.id}_friend` SET status = 'Intention' WHERE id = {self.dest_id}"
                    cursor.execute(sql)
                elif result == 'Black':
                    # 在黑名单中，查看对方是否对自己有意向，如果有，加为好友，如果没有，去除黑名单
                    sql = f"SELECT status FROM `{self.dest_id}_friend` WHERE id = {self.id}"
                    cursor.execute(sql)
                    ret = cursor.fetchone()
                    if ret != None and len(ret) > 0:
                        ret = ret[0]
                    if ret == 'Intention':
                        sql = f"UPDATE `{self.id}_friend` SET status = 'Intention' WHERE id = {self.dest_id}"
                    else:
                        sql = f"DELETE FROM `{self.id}_friend` WHERE id = {self.dest_id}"
                    cursor.execute(sql)
                elif result == 'Intention':
                    # 已是好友关系，无需处理
                    pass
                else:
                    # 对方还没有意向，新增一条记录录
                    sql = f"INSERT INTO `{self.id}_friend` VALUES({self.dest_id}, 'Intention')"
                    cursor.execute(sql)
                    # 同时，应该向对方告知这个消息
                    # 但这有个前提：对方没有将自己加入黑名单
                    sql = f'SELECT status FROM `{self.dest_id}_friend` WHERE id = {self.id}'
                    cursor.execute(sql)
                    ret = cursor.fetchone()
                    if ret != None and len(ret) > 0:
                        ret = ret[0]
                    if ret == 'Black':
                        # 被拉入黑名单，不予通知对方
                        pass
                    else:
                        # 通知对方
                        sql = f"INSERT INTO `{self.dest_id}_friend` VALUES({self.id}, 'Request')"
                        cursor.execute(sql)
            elif self.friendAction == 1:
                # 撤回好友申请/删除好友
                # 查看对方是否对自己有意向
                # 逻辑非常简单，删除自己和对方的记录即可
                sql = f"DELETE FROM `{self.id}_friend` WHERE id = {self.dest_id}"
                cursor.execute(sql)
                # 如果是黑名单，就不需要删对方的了
                sql = f"SELECT status FROM `{self.dest_id}_friend` WHERE id = {self.id}"
                cursor.execute(sql)
                ret = cursor.fetchone()
                if ret != None and len(ret) > 0:
                    ret = ret[0]
                if ret != 'Black':
                    sql = f"DELETE FROM `{self.dest_id}_friend` WHERE id = {self.id}"
                    cursor.execute(sql)
            elif self.friendAction == 2:
                # 查看对方是否在自己的列表里
                sql = f"SELECT status FROM `{self.id}_friend` WHERE id = {self.dest_id}"
                cursor.execute(sql)
                ret = cursor.fetchone()
                if ret != None and len(ret) > 0:
                    # 对方在自己的列表里
                    if ret[0] != 'Black':
                        log.info(ret[0])
                        # 修改
                        sql = f"UPDATE `{self.id}_friend` SET status = 'Black' WHERE id = {self.dest_id}"
                        cursor.execute(sql)
                    else:
                        # 已是黑名单，无需再处理
                        pass
                else:
                    # 不在列表里，插入黑名单信息
                    sql = f"INSERT INTO `{self.id}_friend` VALUES({self.dest_id}, 'Black')"
                    cursor.execute(sql)
            else:
                return False
            self.mysql_cli.commit()
            return True
        except Exception as e:
            log.error(e)
            self.mysql_cli.rollback()
            return False
        
    
    def check_request(self):
        self.id = self.data.get("id", None)
        self.dest_id = self.data.get("dest_id", None)
        self.friendAction = self.data.get("friendAction", None)
        if self.id is None or self.dest_id is None or self.friendAction is None:
            return False
        return True
    
    


# 聊天群创建
class CreateGroup(object):
    def __init__(self) -> None:
        self.mysql_cli = pymysql.connect(**MYSQL_CONF)
        self.redis_cli = redis.Redis(host=REDIS_CONF["host"], port=REDIS_CONF["port"], db=REDIS_CONF["db"])
 
    
    def run(self, data):
        self.data = data
        try:
            # 检查信息是否齐全
            if not self.check_request():
                return CODE_OK,{'success' : False , "mess":"parameter incomplete", 'group_id' : ''}
            # 判断需要加群的用户是否存在
            if not self.check_id():
                return CODE_OK,{'success' : False , "mess":"User does not existst", 'group_id' : ''}
            # 获取群id
            group_id = self.get_group()
            return CODE_OK,{'success' : True, "mess":"", 'group_id' : group_id}
        except Exception as e:
            log.error(e)
            return CODE_OK,{'success' : False , "mess":"" , 'group_id' : ''}
    
    def check_request(self):
        self.id = self.data.get("id", None)
        self.dest_id = self.data.get("dest_id", None)
        if self.id is None or self.dest_id is None:
            return False
        return True
    
    def check_id(self):
        if not id_exist(TB_USER,self.id):
            return False
        ids = self.dest_id.split(';')
        for id in ids:
            if not id_exist(TB_USER,id):
                return False
            # 检查目标是否与当前用户为好友关系
            rela1,rela2 = get_relationship(self.id,id)
            if rela1 != 'Intention' or rela2 != 'Intention':
                return False
            # 否则就是可行的
        return True
            
    
    def get_group(self):
        # 检查群是否已经存在
        # 首先对这些人进行一个排序，按id
        ids = self.dest_id.split(';')
        ids.append(self.id)
        ids.sort()
        ids = ';'.join(ids)
        
        # 如果这些人是否已经有了一个群了，返回旧群号
        cursor = self.mysql_cli.cursor()
        sql = f"SELECT group_id FROM `{TB_GROUP}` WHERE user_list=%s"
        cursor.execute(sql, (ids,))
        group_id = cursor.fetchone()
        if group_id is not None and len(group_id) > 0:
            return group_id[0]
        
        # 新建一个群，返回群号
        group_id = self.create_group(user_list=ids)
        return group_id

        
    def create_group(self, user_list):
        try:
            # 创建群
            # 获取群号
            group_id = None
            i = 1
            for c in user_list:
                if c == ';':
                    i += 1
            while group_id is None:
                if self.redis_cli.set(f"group_id_lock", 1, nx=True, ex=1):
                    try:
                        group_id = self.redis_cli.get(f"group_id")
                        print(group_id)
                        if group_id == None:
                            group_id = 1000000000
                        group_id = int(group_id)
                        self.redis_cli.set(f"group_id", group_id+1)
                        self.redis_cli.delete("group_id_lock")
                    except Exception as e:
                        self.redis_cli.delete("group_id_lock")
                        log.error(f"Create_group.create_group,erro_mess:{e}")
            
            # 创建该群的档案
            sql = f'INSERT INTO `{TB_GROUP}` (group_id, user_list, user_count) VALUES (%s,%s,%s)'
            cursor = self.mysql_cli.cursor()
            cursor.execute(sql, (group_id, user_list, i))
            
            # 建群
            sql = f'''
                CREATE TABLE {group_id}_group (
                    mess_id BIGINT PRIMARY KEY AUTO_INCREMENT,
                    message TEXT,
                    mess_user_id BIGINT,
                    timestamp TIMESTAMP
                )
                '''
            cursor.execute(sql)
            
            # 为每一个人在群里的身份进行设置，创建者为群主，其他人都是普通用户
            sql = 'INSERT INTO {id}_group (group_id, identity) VALUES (%s,%s)'
            cursor.execute(sql.format(id=self.id), (group_id, 2)) # 2级权限是群主
            
            id_list = self.dest_id.split(';')
            for d_id in id_list:
                cursor.execute(sql.format(id=d_id), (group_id, 0)) # 0级权限是普通用户
            
            
            # 事务通过
            self.mysql_cli.commit()
            
        except Exception as e:
            # 事务回滚
            self.mysql_cli.rollback()
            log.error(f"Create_group.create_group,erro_mess:{e}")
        
        return group_id