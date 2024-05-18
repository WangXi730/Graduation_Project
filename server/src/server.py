from fastapi import FastAPI, Header, Depends, Request, Response, WebSocket
import time
from typing import Dict
import asyncio
import json
import pymysql
from datetime import datetime

from common.log import log
from config.config import *

from logic import user

app = FastAPI()

# 明确需求
# 后端程序，需要包括以下几点：
# 1、用户操作：
# 2、管理员操作：
# 3、客户端下载：

# action : (function, desc, owner)
actions = {
    "Login": (user.Login ,"用户登录","ekkowwang"),
    "Logon": (user.Logon,"用户注册","ekkowwang") ,
    "Update": (user.Update,"用户提交个人数据","ekkowwang") ,
    "GetMessage": (user.GetMessage,"获取消息","ekkowwang") ,
    "FriendList": (user.FriendList,"好友列表","ekkowwang"),
    "CreateGroup" : (user.CreateGroup, "创建群聊","ekkowwang"),
    'GetGame' : (user.GetGame,"获取游戏信息","ekkowwang"),
}

@app.post("/user")
async def user_request(request: Request, response: Response, data : Dict, cookie: str = Header(None), request_id: str = str(time.time())):
    action = ""
    request_ip = ""
    code = CODE_OK
    result = {}
    ret = {}
    session_id = None
    
    try:
        # 获取信息
        request_ip = request.client.host
        action = data.get("Action","")
        log.info(f"[{request_id}] [{request_ip}] [{action}] [{cookie}]")
        # 执行动作
        if action in actions:
            if action == "Login":
                #首次获取session_id
                session_id = user.create_session(data.get("id"))
            elif action == "Logon":
                #无需获取session_id
                pass
            else:
                #处理session_id
                old_session_id = cookie[11:]
                st_time = time.time()
                while session_id == None:
                    session_id = user.create_session(data.get("id"),old_session_id)
                    if time.time()-st_time > 10:
                        break
                if session_id == None:
                    return {"StatusCode":CODE_ERROR, "Response":"get session timeout"}
                elif  session_id == "error":
                    return {"StatusCode":CODE_ERROR, "Response":"get session error, place login age!"}
            func, desc, owner = actions.get(action)
            code, result = func().run(data)
            if action == 'Login' and result.get('success') == False:
                session_id = None
        ret = {"StatusCode":code, "Response":result}
        
    except Exception as e:
        log.error(f"[{request_id}] [{request_ip}] [user] [{action}] [{cookie}] [{e}]")
        ret = {"StatusCode":CODE_ERROR, "Response":str(e)}
    
    if session_id != None:
        response.set_cookie(key="session_id", value=session_id)
    
    return ret
    

@app.post("/manager")
async def manager_request():
    pass
        
user_link_map = dict()
user_mess_buffer = dict()

insert_sql = "insert into {group_id}_group (message, mess_user_id, timestamp) values (%s, %s, %s)"
select_sql_group_member = f"select user_list from {TB_GROUP} where group_id = %s"
select_sql_get_new_mess = "select * from {group_id}_group where mess_id = %s"

select_sql_new20 = "select * from {group_id}_group order by mess_id desc limit 20"
select_sql_l_r = "select * from {group_id}_group where mess_id between %s and %s"

@app.websocket("/talk/{userid}")
async def websocket_endpoint(websocket: WebSocket, userid: str):
    try:
        await websocket.accept()
        
        user_link_map[userid] = websocket
        
        # 创建数据库具柄
        mysql_handle = pymysql.connect(host=MYSQL_CONF['host'], user=MYSQL_CONF['user'], password=MYSQL_CONF['password'], database=MYSQL_CONF['database'])
        
        # 获取用户信息
        
        while True:
            message = await websocket.receive_json()
            if message == 'exit':
                break
            else:
                # 解析message
                # message = json.loads(message)
                '''
                message = {
                    "Action" : "sendMessage" | "getMessage" |'heartBeat', # 发送消息和请求获取消息
                    "group_id" : "xxxxxxx", # 要进行操作的群聊
                    "sendMessage" : "", # 要发送的消息
                    "getMessage" : {
                        "left" : "xxxx",# 最小id，可以为None
                        "right": "xxxx", # 最大id，可以为None
                        #如果全为空，默认返回最近的最多20条消息
                    }
                }
                '''
                action = message['Action']
                group_id = message['group_id']
                if action == "heartBeat":
                    if userid not in user_mess_buffer or not isinstance(user_mess_buffer[userid],list) or len(user_mess_buffer[userid]) == 0:
                        await websocket.send_json("heartBeat")
                    else:
                        await websocket.send_json(user_mess_buffer[userid])
                        # 清空消息缓冲区
                        user_mess_buffer[userid] = list()
                elif action == "sendMessage":
                    message_info = message['sendMessage']
                    # 向group_id对应的群聊更新最新的数据
                    cursor = mysql_handle.cursor()
                    cursor.execute(insert_sql.format(group_id=group_id), (message_info,userid,datetime.now()))
                    mysql_handle.commit()
                    # 向所有在线的一个群的人员发送消息
                    # 要发送的消息
                    last_insert_id = cursor.lastrowid
                    cursor.execute(select_sql_get_new_mess.format(group_id=group_id), (last_insert_id,))
                    mess = cursor.fetchone()
                    serialized_mess = []
                    for i in mess:
                        if isinstance(i,datetime):
                            serialized_mess.append(i.strftime("%Y-%m-%d %H:%M:%S"))
                        else:
                            serialized_mess.append(i)

                    #要发送的人
                    cursor.execute(select_sql_group_member, (group_id,))
                    userlist = cursor.fetchone()[0]
                    userlist = userlist.split(';')
                    
                    # for user in userlist:
                    #     if user in user_link_map:
                    #         await user_link_map[user].send_json(mess)
                    # 放入缓冲区，等待心跳
                    for user in userlist:
                        if user in user_link_map:
                            if user not in user_mess_buffer or not isinstance(user_mess_buffer[user],list):
                                user_mess_buffer[user] = list()
                            user_mess_buffer[user].append(serialized_mess)
                    
                else:
                    # 获取消息
                    cursor = mysql_handle.cursor()
                    left = message['getMessage']['left']
                    right = message['getMessage']['right']
                    
                    if left == None and right == None:
                        cursor.execute(select_sql_new20.format(group_id=group_id))
                    elif left == None or right-left >= 20:
                        cursor.execute(select_sql_l_r.format(group_id=group_id), (max(right-20,0),right,))
                    else:
                        cursor.execute(select_sql_l_r.format(group_id=group_id), (left,right,))
                    
                    mess = cursor.fetchall()
                    serialized_mess = []
                    for i in mess:
                        cell_serialized = []
                        for j in i:
                            if isinstance(j,datetime):
                                cell_serialized.append(j.strftime("%Y-%m-%d %H:%M:%S"))
                            else:
                                cell_serialized.append(j)
                        serialized_mess.append(cell_serialized)
                    await websocket.send_json(serialized_mess)
                    
                    
                
    except Exception as e:
        if websocket in user_link_map.values():
            del user_link_map[websocket]
