import requests
import websockets
import json
import asyncio
import os
import argparse
import threading

parser = argparse.ArgumentParser()
parser.add_argument('--ip', help='IP address')
parser.add_argument('--port', help='Port number')
args = parser.parse_args()

ip = args.ip
port = args.port


desktop_path = os.path.join(os.path.join(os.environ['USERPROFILE']), 'Desktop')

def net_logon(username,password):
    url = f"http://{ip}:{port}/user"
    header = {
        "cookie": ""
    }
    data = {
        "Action": "Logon",
        "username": username,
        "password": password
    }
    response = requests.post(url=url, headers=header, json=data)
    response = response.json()
    # print(response)
    return response['Response']['id']


# 返回session和双向通信的句柄
def net_login(id,password):
    # 登陆操作分为两部分
    # 1、注册一个session
    url = f"http://{ip}:{port}/user"
    header = {
        "cookie": ""
    }
    data = {
        "Action": "Login",
        "id": id,
        "password": password
    }

    response = requests.post(url=url, headers=header, json=data)

    success = response.json()["Response"]["success"]
    if not success:
        return None,response.json()["Response"]["mess"],None

    # # 2、连接到双向通信中
    # # websocket = await websockets.connect('http://{ip}:')
    groups = response.json()['Response']['groups']
    url = f"ws://{ip}:{port}/talk/{id}"
    # this_connect = await websockets.connect(url)

    return response.cookies.get('session_id'),url,groups


def net_game_list(id,session_id,keyword):
    url = f"http://{ip}:{port}/user"
    cookies = {"session_id": session_id}
    data =  {
        "Action" : "GetGame",
        'id' : id,
        "keyword" : keyword,
    }
    response = requests.post(url=url, cookies=cookies, json=data)
    # print(response.text)
    return response.cookies.get('session_id'),response.json()['Response']['games']

def net_download_game(api_url):
    # 定义 FastAPI 服务器的地址
    # api_url = "http://localhost:8000/download"
    # 发送 GET 请求到 /download 路由
    response = requests.get(url=api_url)
    # 检查响应状态码
    if response.status_code == 200:
        # 获取文件名
        content_disposition = response.headers.get("Content-Disposition")
        if content_disposition:
            file_name = content_disposition.split("filename=")[1].strip('"')
        else:
            file_name = "downloaded_file.txt"

        file_name = f'{desktop_path}\{file_name}'

        # 保存响应内容到文件
        with open(file_name, "wb") as file:
            file.write(response.content)
        print(f"文件已下载到 {file_name}")
    else:
        print(f"下载失败，状态码: {response.status_code}")

class WebSocketClient:
    def __init__(self,id,group_id, heartbeat_interval=1):
        self.uri = f"ws://{ip}:{port}/talk/{id}"
        self.loop = asyncio.new_event_loop()
        self.thread = threading.Thread(target=self.start_loop, args=(self.loop,))
        self.mess = "heartBeat"
        self.heartbeat_interval = heartbeat_interval
        self.thread.start()
        self.stop_event = threading.Event()
        self.message = {
            "Action": "heartBeat",  # 发送消息和请求获取消息
            "group_id": group_id,  # 要进行操作的群聊
            "sendMessage": "",  # 要发送的消息
            "getMessage": {
                "left": None,  # 最小id，可以为None
                "right": None,  # 最大id，可以为None
                # 如果全为空，默认返回最近的最多20条消息
            }
        }

    def start_loop(self, loop):
        asyncio.set_event_loop(loop)
        loop.run_until_complete(self.connect())

    async def connect(self):
        async with websockets.connect(self.uri) as websocket:
            self.websocket = websocket
            self.heartbeat_task = asyncio.create_task(self.send_heartbeat())
            while True:
                result = await websocket.recv()
                self.on_message(result)

    async def send_heartbeat(self):
        while True:
            await asyncio.sleep(self.heartbeat_interval)
            if self.message['Action'] == 'heartBeat':
                await self.websocket.send(json.dumps(self.message))

    def on_message(self, message):
        print("Received message:", message)

    def get_mess(self, message):
        self.message["Action"] = "getMessage"
        self.message["getMessage"] = message
        asyncio.run_coroutine_threadsafe(self.websocket.send(json.dumps(self.message)), self.loop)
        self.message['Action'] = 'heartBeat'

    def set_mess(self, message):
        self.message["Action"] = "sendMessage"
        self.message["sendMessage"] = message
        asyncio.run_coroutine_threadsafe(self.websocket.send(json.dumps(self.message)), self.loop)
        self.message['Action'] = 'heartBeat'

    def close(self):
        self.stop_event.set()
        if self.websocket is not None:
            asyncio.run_coroutine_threadsafe(self._close(), self.loop)
        self.thread.join()

    async def _close(self):
        if self.heartbeat_task is not None:
            self.heartbeat_task.cancel()
        await self.websocket.close()


async def get_message():
    message = {
        "Action": "getMessage",  # 发送消息和请求获取消息
        "group_id": "xxxxxxx",  # 要进行操作的群聊
        "sendMessage": "",  # 要发送的消息
        "getMessage": {
            "left": None,  # 最小id，可以为None
            "right": None,  # 最大id，可以为None
            # 如果全为空，默认返回最近的最多20条消息
        }
    }
    for group in groups:
        message['group_id'] = group['group_id']
        await this_connect.send(json.dumps(message))
        result = await this_connect.recv()
        print(result)

def net_get_mess(session_id,id,data_type):
    url = f"http://{ip}:{port}/user"
    cookies = {"session_id": session_id}
    data = {
        "Action": "GetMessage",
        "id": id,
        "data_type": data_type
    }
    response = requests.post(url=url, cookies=cookies, json=data)
    print(response.text)
    return response.cookies.get('session_id'),response.json()["Response"]["data"]


def test_update_info(session_id):
    url = f"http://{ip}:{port}/user"
    cookies = {"session_id": session_id}
    data = {
        "Action": "Update",
        "id": "1000000002",
        "data_type": ["username"],
        "old_data": ['test_ekkowwang'],
        "new_data": ["playmaker"]
    }
    response = requests.post(url=url, cookies=cookies, json=data)
    print(response.text)
    return response.cookies.get('session_id')


create_sql_list = [
    '''
        CREATE TABLE {user_id}_friend (
            id BIGINT PRIMARY KEY,
            status VARCHAR(10),
        );
    '''
]


def net_friend(session_id, id, dest_id, action=0):
    url = f"http://{ip}:{port}/user"
    cookies = {"session_id": session_id}
    data = {
        "Action": "FriendList",
        "id": id,
        "dest_id": dest_id,
        "friendAction": action
    }
    response = requests.post(url=url, cookies=cookies, json=data)
    print(response.text)

    return response.cookies.get('session_id')

def net_get_friend(session_id,id):
    url = f"http://{ip}:{port}/user"
    cookies = {"session_id": session_id}
    data = {
        "Action": "GetFriendList",
        'id': id,
    }
    response = requests.post(url=url, cookies=cookies, json=data)
    print(response.text)
    res_json = response.json()
    return response.cookies.get('session_id'),res_json["Response"]["userlist"]

def net_create_group(session_id, id, dest_id):
    url = f"http://{ip}:{port}/user"
    cookies = {"session_id": session_id}
    data = {
        "Action": "CreateGroup",
        "id": id,
        "dest_id": ';'.join(dest_id),
    }
    response = requests.post(url=url, cookies=cookies, json=data)
    print(response.text)
    res_json = response.json()
    return response.cookies.get('session_id'),res_json['Response']['group_id'],res_json["Response"]["mess"],res_json['Response']['success']



async def test_send_mess(websocket, group_id, mess):
    # 发送消息
    message = {
        "Action": "sendMessage",  # 发送消息和请求获取消息
        "group_id": "xxxxxxx",  # 要进行操作的群聊
        "sendMessage": "",  # 要发送的消息
        "getMessage": {
            "left": None,  # 最小id，可以为None
            "right": None,  # 最大id，可以为None
            # 如果全为空，默认返回最近的最多20条消息
        }
    }
    message['group_id'] = group_id
    message['sendMessage'] = mess
    await websocket.send(json.dumps(message))


# 心跳监听机制
async def test_recv_mess(id,websocket):
    # 获取句柄
    # 心跳信息
    message = {
        "Action": 'heartBeat',  # 发送消息和请求获取消息
        "group_id": "xxxxxxx",  # 要进行操作的群聊
        "sendMessage": "",  # 要发送的消息
        "getMessage": {
            "left": "xxxx",  # 最小id，可以为None
            "right": "xxxx",  # 最大id，可以为None
            # 如果全为空，默认返回最近的最多20条消息
        }
    }
    # 接收消息
    while True:
        await asyncio.sleep(1)
        await websocket.send(json.dumps(message))
        result = await websocket.recv()
        print(f"{id}:\n" + result)
        print(type(result))


async def main_of_friend_list(sessionid, u11, u12):
    # 用户11向用户12发送好友请求
    sessionid[u11] = test_friend(sessionid[u11], u11, u12)

    # 用户12同意
    sessionid[u12] = test_friend(sessionid[u12], u12, u11)

    # 用户12删好友11
    sessionid[u12] = test_friend(sessionid[u12], u12, u11, 1)

    # 用户11删好友12
    sessionid[u11] = test_friend(sessionid[u11], u11, u12, 1)

    #  用户12拉黑用户11
    sessionid[u12] = test_friend(sessionid[u12], u12, u11, 2)


async def main_of_create_group(sessionid, u11, u12, u13):
    #  三人互相加好友
    sessionid[u11] = test_friend(sessionid[u11], u11, u12)
    sessionid[u11] = test_friend(sessionid[u11], u11, u13)
    sessionid[u12] = test_friend(sessionid[u12], u12, u11)
    sessionid[u12] = test_friend(sessionid[u12], u12, u13)
    sessionid[u13] = test_friend(sessionid[u13], u13, u12)
    sessionid[u13] = test_friend(sessionid[u13], u13, u11)

    # u13创建一个三人的群聊
    sessionid[u13] = test_create_group(sessionid[u13], u13, [u12, u11])


async def main_of_send_message(u11, u12, u13, group_id, mess):
    # 三个人进入监听状态
    listen_task1 = asyncio.create_task(test_recv_mess(u11))
    listen_task2 = asyncio.create_task(test_recv_mess(u12))
    listen_task3 = asyncio.create_task(test_recv_mess(u13))

    # u11在群里发一句话
    send1 = asyncio.create_task(test_send_mess(u11, group_id, mess))

    # 启动任务
    await asyncio.gather(listen_task1, listen_task2, listen_task3, send1)


async def main():
    # test_logon()
    # test()
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
        u11: None,
        u12: None,
        u13: None
    }

    sessionid[u11] = await test_login(u11)
    sessionid[u12] = await test_login(u12)
    sessionid[u13] = await test_login(u13)

    # 创建群聊
    # await main_of_create_group(sessionid,u11,u12,u13)

    # 发消息
    await main_of_send_message(u11, u12, u13, group_id, '你好')


if __name__ == '__main__':
    asyncio.run(main())