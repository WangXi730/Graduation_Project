from config.config import *

import pymysql
import redis
from common.log import log
import time
import secrets
import string


class Update(object):
    def __init__(self) -> None:
        self.mysql_cli = pymysql.connect(**MYSQL_CONF)
    def run(self,data): 
        response = {
            'success' : False,
            'mess' : ''
        }

        # 获取信息       
        self.data = data
        if not self.get_mess():
            response['mess'] = 'requests error'
            return CODE_OK, response

        # 将数据插入数据库
        ret_code = CODE_OK

        response['success'],response['mess'] =  self.insert_db()
        
        # 返回数据
        return ret_code,response

    def get_mess(self):
        self.gamename = self.data.get('name','')
        self.url = self.data.get('download_url','')
        if self.gamename == '' or self.url == '':
            return False
        return True
    
    def insert_db(self):
        try:
            cursor = self.mysql_cli.cursor()
            sql = 'insert into game_list values(%s,%s)'
            cursor.execute(sql,(self.gamename,self.url))
            self.mysql_cli.commit()
            return True,''
        except Exception as e:
            self.mysql_cli.rollback()
            log.erro_mess(f'Manager.Update.insert_db: {str(e)}')
            return False,str(e)


