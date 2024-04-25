import asyncio
import websockets
import json
import pymysql


from config import config

MYSQL_CONF = config.MYSQL_CONF

user_link_map = dict()

insert_sql = "insert into {group_id}_group (message, mess_user_id, timestamp) values (%s, %s, %s)"

select_sql_new20 = "select * from {group_id}_group order by mess_id desc limit 20"

select_sql_l_r = "select * from {group_id}_group where mess_id between %s and %s"

async def accept_mess(websocket, path):
    try:
        await websocket.accept()
        
        #从path中提取用户id，path为/userid

        userid = path.split('/')[1]
        
        user_link_map[userid] = websocket
        
        # 创建数据库具柄
        mysql_handle = pymysql.connect(host=MYSQL_CONF['host'], user=MYSQL_CONF['user'], password=MYSQL_CONF['password'], database=MYSQL_CONF['database'])
        
        # 获取用户信息
        
        while True:
            message = await websocket.recv()
            if message == 'exit':
                break
            else:
                # 解析message
                message = json.loads(message)
                '''
                message = {
                    "Action" : "sendMessage" | "getMessage", # 发送消息和请求获取消息
                    "group_id" : "xxxxxxx", # 要进行操作的群聊
                    "sendMessage" : "" # 要发送的消息
                    "getMessage" : {
                        "left" : "xxxx",# 最小id，可以为None
                        "right": "xxxx", # 最大id，可以为None
                        #如果全为空，默认返回最近的最多20条消息
                    }
                }
                '''
                action = message['Action']
                group_id = message['group_id']
                if action == "sendMessage":
                    message_info = message['sendMessage']
                    # 向group_id对应的群聊更新最新的数据
                    cursor = mysql_handle.cursor()
                    cursor.execute(insert_sql.format(group_id=group_id), (message_info,userid,))
                else:
                    pass
                
    except websockets.ConnectionClosed:
        if websocket in user_link_map.values():
            del user_link_map[websocket]

