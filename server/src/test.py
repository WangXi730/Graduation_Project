import requests

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


def test_login(id):
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
    


if __name__ == "__main__":
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
    u11 = '1000000068'
    u12 = '1000000069'
    u13 = '1000000070'
    
    
    sessionid = {
        u11 : None,
        u12 : None,
        u13 : None
    }
    sessionid[u11] = test_login(u11)
    sessionid[u12] = test_login(u12)
    sessionid[u13] = test_login(u13)
    
    # # 用户11向用户12发送好友请求 
    # sessionid[u11] = test_friend(sessionid[u11],u11,u12)
    
    # # 用户12同意
    # sessionid[u12] = test_friend(sessionid[u12],u12,u11)
    
    # # 用户12删好友11
    # sessionid[u12] = test_friend(sessionid[u12],u12,u11,1)
    
    # # 用户11删好友12
    # sessionid[u11] = test_friend(sessionid[u11],u11,u12,1)
    
    # #  用户12拉黑用户11
    # sessionid[u12] = test_friend(sessionid[u12],u12,u11,2)

    # #  三人互相加好友
    # sessionid[u11] = test_friend(sessionid[u11],u11,u12)
    # sessionid[u11] = test_friend(sessionid[u11],u11,u13)
    # sessionid[u12] = test_friend(sessionid[u12],u12,u11)
    # sessionid[u12] = test_friend(sessionid[u12],u12,u13)
    # sessionid[u13] = test_friend(sessionid[u13],u13,u12)
    # sessionid[u13] = test_friend(sessionid[u13],u13,u11)
    
    
    sessionid[u13] = test_create_group(sessionid[u13],u13,[u12,u11])
    

