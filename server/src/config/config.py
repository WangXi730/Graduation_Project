

CODE_OK = 0
CODE_ERROR = 1
CODE_TIMEOUT = 2

MYSQL_CONF = {
    "host": "172.17.0.5",
    "user": "Graduation_server",
    "password": "123456",
    "database": "graduation_project"
}

TB_USER = "tb_user" #用于存储用户信息，创建表的sql语句如下：
'''
CREATE TABLE tb_user (
  id BIGINT PRIMARY KEY,
  username VARCHAR(20),
  password VARCHAR(20)
);
'''
TB_INDEX = "tb_index" #用于存储数据存放位置，创建表的sql语句如下：
'''
CREATE TABLE tb_index (
  data_name VARCHAR(20),
  data_table VARCHAR(20)
);
'''
TB_GROUP = "group_map" #用于存储数据存放位置，创建表的sql语句如下：
'''
CREATE TABLE group_map (
    group_id BIGINT PRIMARY KEY,
    user_list TEXT,
    user_count SMALLINT
);
'''

REDIS_CONF = {
    "host": "172.17.0.6",
    "port": 6379,
    "db": 0
}

