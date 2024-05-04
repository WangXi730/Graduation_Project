import requests
import websockets
import json

def test_logon():
    url = "http://172.17.0.2:80/user"
    header = {
        "cookie":""
    }
    data = {
        "Action" : "Logon",
        "username" : "test_ekkowwang",
        "password" : "111111"
    }
    response = requests.post(url=url, headers=header, json=data)
    response = response.json()
    print(response)
    return response['Response']['id']

id_session_map = dict()
async def test_login(id):
    # 登陆操作分为两部分
    # 1、注册一个session
    url = "http://172.17.0.2:80/user"
    header = {
        "cookie":""
    }
    data = {
        "Action" : "Login",
        "id" : id,
        "password" : "111111"
    }
    response = requests.post(url=url, headers=header, json=data)
    print(response.text)
    print(response.cookies.get('session_id'))
    print(type(response.cookies.get('session_id')))
    
    # # 2、连接到双向通信中
    # websocket = await websockets.connect('http://172.17.0.2:')
    groups = response.json()['Response']['groups']
    url = f"ws://172.17.0.2:80/talk/{id}"
    this_connect = await websockets.connect(url)
    message = {
        "Action" : "getMessage", # 发送消息和请求获取消息
        "group_id" : "xxxxxxx", # 要进行操作的群聊
        "sendMessage" : "", # 要发送的消息
        "getMessage" : {
            "left" : None,# 最小id，可以为None
            "right": None, # 最大id，可以为None
            #如果全为空，默认返回最近的最多20条消息
        }
    }
    for group in groups:
        message['group_id'] = group['group_id']
        await this_connect.send(json.dumps(message))
        result = await this_connect.recv()
        print(result)
        id_session_map[id] = this_connect
    
    return response.cookies.get('session_id')

def test_get_mess(session_id):
    url = "http://172.17.0.2:80/user"
    cookies = {"session_id" : session_id}
    data = {
        "Action" : "GetMessage",
        "id" : "1000000002",
        "data_type" : ["username"]
    }
    response = requests.post(url=url, cookies=cookies, json=data)
    print(response.text)
    return response.cookies.get('session_id')


def test_update_info(session_id):
    url = "http://172.17.0.2:80/user"
    cookies = {"session_id" : session_id}
    data = {
        "Action" : "Update",
        "id" : "1000000002",
        "data_type" : ["username"],
        "old_data" : ['test_ekkowwang'],
        "new_data" : ["playmaker"]
    }
    response = requests.post(url=url, cookies=cookies, json=data)
    print(response.text)
    return response.cookies.get('session_id')


class A():
    def func(self):
        print("A")
class B(A):
    pass

create_sql_list = [
    '''
        CREATE TABLE {user_id}_friend (
            id BIGINT PRIMARY KEY,
            status VARCHAR(10),
        );
    '''
]


def test_friend(session_id,id,dest_id,action=0):
    url = "http://172.17.0.2:80/user"
    cookies = {"session_id" : session_id}
    data = {
        "Action" : "FriendList",
        "id" : id,
        "dest_id" : dest_id,
        "friendAction" : action
    }
    response = requests.post(url=url, cookies=cookies, json=data)
    print(response.text)

    return response.cookies.get('session_id')

def test_create_group(session_id,id,dest_id):
    url = "http://172.17.0.2:80/user"
    cookies = {"session_id" : session_id}
    data = {                    
        "Action" : "CreateGroup",
        "id" : id,
        "dest_id" : ';'.join(dest_id),
    }
    response = requests.post(url=url, cookies=cookies, json=data)
    print(response.text)

    return response.cookies.get('session_id')
    
async def test_send_mess(id,group_id,mess):
    #获取句柄
    websocket = id_session_map[id]
    #发送消息
    message = {
        "Action" : "sendMessage", # 发送消息和请求获取消息
        "group_id" : "xxxxxxx", # 要进行操作的群聊
        "sendMessage" : "", # 要发送的消息
        "getMessage" : {
            "left" : None,# 最小id，可以为None
            "right": None, # 最大id，可以为None
            #如果全为空，默认返回最近的最多20条消息
        }
    }
    message['group_id'] = group_id
    message['sendMessage'] = mess
    await websocket.send(json.dumps(message))

async def test_recv_mess(id):
    #获取句柄
    websocket = id_session_map[id]
    #接收消息
    while True:
        result = await websocket.recv()
        print(f"{id}:\n" + result)
        print(type(result))

async def main_of_friend_list(sessionid,u11,u12):
    # 用户11向用户12发送好友请求 
    sessionid[u11] = test_friend(sessionid[u11],u11,u12)
    
    # 用户12同意
    sessionid[u12] = test_friend(sessionid[u12],u12,u11)
    
    # 用户12删好友11
    sessionid[u12] = test_friend(sessionid[u12],u12,u11,1)
    
    # 用户11删好友12
    sessionid[u11] = test_friend(sessionid[u11],u11,u12,1)
    
    #  用户12拉黑用户11
    sessionid[u12] = test_friend(sessionid[u12],u12,u11,2)

async def main_of_create_group(sessionid,u11,u12,u13):
    #  三人互相加好友
    sessionid[u11] = test_friend(sessionid[u11],u11,u12)
    sessionid[u11] = test_friend(sessionid[u11],u11,u13)
    sessionid[u12] = test_friend(sessionid[u12],u12,u11)
    sessionid[u12] = test_friend(sessionid[u12],u12,u13)
    sessionid[u13] = test_friend(sessionid[u13],u13,u12)
    sessionid[u13] = test_friend(sessionid[u13],u13,u11)
    
    # u13创建一个三人的群聊
    sessionid[u13] = test_create_group(sessionid[u13],u13,[u12,u11])

async def main_of_send_message(sessionid,u11,u12,u13,group_id,mess):
    sessionid[u11] = await test_login(u11)
    sessionid[u12] = await test_login(u12)
    sessionid[u13] = await test_login(u13)
    
    # 三个人进入监听状态
    listen_task1 = asyncio.create_task(test_recv_mess(u11))
    listen_task2 = asyncio.create_task(test_recv_mess(u12))
    listen_task3 = asyncio.create_task(test_recv_mess(u13))
    
    # u11在群里发一句话
    send1 = asyncio.create_task(test_send_mess(u11,group_id,mess))

    # 启动任务
    await asyncio.gather(listen_task1,listen_task2,listen_task3,send1)
     
async def main():
    # test_logon()
    #test()
    # test_get_mess(test_login())
    # test_update_info(test_login())
    # print(create_sql_list[0].format(user_id='11111'))
    # test_logon()
    
    # # 注册
    # u11 = test_logon()
    # u12 = test_logon()
    # u13 = test_logon()
    # print(f'u11 : {u11}')
    # print(f'u12 : {u12}')
    # print(f'u13 : {u13}')
    
    
    # 登陆
    u11 = '1000000074'
    u12 = '1000000075'
    u13 = '1000000076'
    group_id = "1000000006"
    
    
    sessionid = {
        u11 : None,
        u12 : None,
        u13 : None
    }
    
    sessionid[u11] = await test_login(u11)
    sessionid[u12] = await test_login(u12)
    sessionid[u13] = await test_login(u13)

    #创建群聊
    # await main_of_create_group(sessionid,u11,u12,u13)
    
    # 发消息
    await main_of_send_message(sessionid,u11,u12,u13,group_id,'你好')


if __name__ == '__main__':
    import asyncio
    asyncio.run(main())