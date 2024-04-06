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
    print(response.text)


def test_login():
    url = "http://172.17.0.2:80/user"
    header = {
        "cookie":""
    }
    data = {
        "Action" : "Login",
        "id" : "1000000002",
        "password" : "111111"
    }
    response = requests.post(url=url, headers=header, json=data)
    print(response.text)
    print(response.cookies.get('session_id'))
    print(type(response.cookies.get('session_id')))
    return response.cookies.get('session_id')

def test_get_mess(session_id):
    url = "http://172.17.0.2:80/user"
    cookies = {"session_id=" : session_id}
    data = {
        "Action" : "GetMessage",
        "id" : "1000000002",
        "data_type" : ["username"]
    }
    response = requests.post(url=url, cookies=cookies, json=data)
    print(response.text)


if __name__ == "__main__":
    # test_logon()
    #test()
    test_get_mess(test_login())
    
    