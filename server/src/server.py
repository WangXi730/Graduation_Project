from fastapi import FastAPI, Header, Depends, Request, Response
from pydantic import BaseModel
import time
from typing import Dict

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
                    return {"StatusCode":CODE_ERROR, "ret":"get session timeout"}
                elif  session_id == "error":
                    return {"StatusCode":CODE_ERROR, "ret":"get session error, place login age!"}
            func, desc, owner = actions.get(action)
            code, result = func().run(data)
        ret = {"StatusCode":code, "ret":result}
        
    except Exception as e:
        log.error(f"[{request_id}] [{request_ip}] [{action}] [{cookie}] [{e}]")
        ret = {"StatusCode":CODE_ERROR, "ret":str(e)}
    
    if session_id != None:
        response.set_cookie(key="session_id", value=session_id)
    
    return ret
    

@app.post("/manager")
async def manager_request():
    pass

@app.get("/download")
async def download_request():
    pass


@app.post("/test")
async def user_request(request: Request, response: Response, data : Dict, cookie: str = Header(None), request_id: str = str(time.time())):
    print(f"data = {data}")
    print(f"cookie = {cookie},cookie_type = {type(cookie)}")
    print(f"sessionid={cookie[11:]}")
    return data

