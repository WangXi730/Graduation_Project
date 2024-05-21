import requests
from aiohttp import ClientSession
import websockets
import json
import asyncio
from config.config import *

session = ""

async def post_request(url,cookies,data):
    async with ClientSession() as session:
        async with session.get(url,cookies=cookies,json=data) as response:
            return await response.json()

async def logon(username,password):
    url = f"http://{IP}:{PORT}/user"
    cookies = ""
    data = {
        "Action" : "Logon",
        "username" : username,
        "password" : password
    }
    response = await post_request(url,cookies,data)
    return response

async def login(id):
    # 1、注册一个session
    url = f"http://{IP}:{PORT}/user"
    cookies = ""
    data = {
        "Action" : "Login",
        "id" : id,
        "password" : "111111"
    }
    response = await post_request(url,cookies,data)
    session = response.cookies.get('session_id')
    
    # 2、链接到双向通信中
    groups = response['Response']['group']
    url = f"ws://{IP}:{PORT}/talk/{id}"
    
