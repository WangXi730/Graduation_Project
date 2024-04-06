server功能：<br>
接收三种路由的post请求：/user、/manager、/download<br><br>


1、/user：<br>
user代表着用户有关的一切操作入口，目前的设计思路是：具备登录、注册、提交个人信息、好友系统功能
```python
1、登录
    1.1 简要说明
        用户输入账号密码，登录到平台上，之后以账号信息进行活动
    1.2 事件流
        1.2.1 基本流
            (1) 用户通过客户端组织用户id和密码，具体形式如下
                {
                    "Action" : "Login",
                    "id" : "1000000004",
                    "password" : "xxxxxxxxx",
                }
            (2) 服务器验证id和密码是否匹配，用户id和密码在数据库中存储
                查询sql:
                    select password from {TB_USER} where id={id};
            (3) 以正文发送到服务器80端口下的/user下
                服务器返回给用户一个确认登陆信息
                cookie :{
                    "session_id" : "xxxxxx"
                }
                data : {
                    Response:{
                            "success" : true,
                            "mess" : "login success"
                    },
                    StatusCode: 0
                }
        1.2.2 备选流
            在基本流第2步中，可能出现查询结果不存在的情况，返回下面信息
                {
                    Response:{
                            "success" : false,
                            "mess" : "password error"
                    }
                    StatusCode: 0
                }
            如果id不存在或者格式错误，返回下列信息
                {
                    Response:{
                            "success" : false,
                            "mess" : "id error"
                    }
                    StatusCode: 0
                }
            如果获取session_id时多次出错导致最终耗时比较长，报错返回
                {
                    Response:{
                            "success" : false,
                            "mess" : "get session timeout"
                    }
                    StatusCode: 0
                }
    1.3 特殊需求
        无
    1.4 前置条件
        用户在客户端程序进行登陆操作
    1.5 后置条件
        用户接下来的行为以账号身份进行
    1.6 扩展性
        在安全检测方面有扩展的可能
2、注册
    2.1 简要说明
        用户设定用户名和密码，用户名和密码只有长度要求，注册成功后，向用户分配一个唯一ID，作为这个用户的账号
    2.2 事件流
        2.2.1 基本流
            (1) 用户通过客户端组织用户名和密码发送给服务器，报文信息如下：
                {
                    "Action" : "Logon",
                    "username" : "ekkowwang",
                    "password" : "xxxxxxxxx"
                }
            (2) 服务器检查用户名和密码长度是否合适，如果合适，为用户分配id并创建账号
                插入sql:
                    insert into {TB_USER} (id, username, password) values ({id}, {username}, {password});
            (3) 服务器返回账号的id给客户端，报文信息如下：
                {
                    "StatusCode" : 0,
                    "Response" : {
                        "success" : true,
                        "id" : "1000000004"
                        "mess" : "create user success"
                    }
                }
        2.2.2 备选流
            (1) 在基本流2中，如果用户传入的用户名和密码长度不合适，拒绝为用户创建账号并返回错误，报文信息如下
                {
                    "StatusCode" : 0,
                    "Response" : {
                        "success" : false,
                        "id" : ""
                        "mess" : "username or password length error"
                    }
                }
            (2) 在为用户申请id时，申请id的人可能较多，导致一直没申请到id，超过10秒，不再给用户申请账号并向用户返回错误信息，报文如下：
                {
                    "StatusCode" : 0,
                    "Response" : {
                        "success" : false,
                        "id" : ""
                        "mess" : "get id timeout"
                    }
                }
            (3) 在使用数据库的时候，总是会出现各种问题，如果在给用户创建账号时发生了数据库报错，向用户返回错误信息，报文如下：
                {
                    "StatusCode" : 0,
                    "Response" : {
                        "success" : false,
                        "id" : ""
                        "mess" : "create user fail"
                    }
                }
    2.3 特殊需求
        无
    2.4 前置条件
        用户通过客户端发送注册请求
    2.5 后置条件
        用户获得id并拥有账号
    2.6 扩展性
        无

3、用户提交信息
    3.1 简要说明
        用户修改自己的信息
    3.2 事件流
        3.2.1 基本流
            (1) 用户编辑信息，并且提交，报文信息如下：
                {
                    "Action" : "Update",
                    "id" : "1000000002",
                    "data_type" : ["type_name1","type_name2",...,"type_namen"],
                    "old_data" : ["old_data1","old_data2",...,"old_datan"],
                    "new_data" : ["new_data1","new_data2",...,"new_datan"]
                }
            (2) 服务器收到报文，验证session_id，并更改session_id
            (3) 服务器查询data_type在哪张表
                sql语句如下
                select data_table from {TB_INDEX} where data_name = {data_type};
            (4) 服务器查询该信息，对比old_data信息，看是否有误
                sql语句如下
                select {data_type} from {/*上一次查询结果*/} where id = {id};
            (5) 服务器修改信息，并且返回修改成功报文
                {
                    "success" : true,
                    "mess" : "update success"
                }
        3.2.2 备选流
            (1) 用户提交的旧数据与数据库中原本的信息不匹配，返回报文如下：
                {
                    "success" : false,
                    "mess" : "old data error"
                }
            (2) 用户提交的新数据格式有误
                {
                    "success" : false,
                    "mess" : "data format error"
                }
            (3) 查询过程中sql出现错误
                {
                    "success" : false,
                    "mess" : "server error"
                }
    3.3 特殊要求
        无
    3.4 前置条件
        用户处于登陆状态，发起提交信息的请求
    3.5 后置条件
        用户信息改变，客户端向服务器触发一次信息获取请求
    3.6 扩展性
        获取的信息可以是各种各样的，维护一张表，用于存储每个信息放在哪个表里
4、用户获取信息
    4.1 简要说明
        用户进入某页面时，该页面需要向用户展示的信息
    4.2 事件流
        4.2.1 基本流
            (1) 客户端发送获取信息请求，报文如下：
                {
                    "Action" : "GetMessage",
                    "id" : "1000000002",
                    "data_type" : ["type_name1","type_name2",...,"type_namen"]
                }
            (2) 服务器根据发送的需要获取的信息，查询所在的表
                sql语句如下
                select data_table from {TB_INDEX} where data_name = {data_type};
            (3) 服务器查询数据
                sql语句如下
                select {data_type} from {data_table} where id = {id};
            (4) 服务器返回数据，报文如下
                {
                    "success" : true,
                    "data_type" : ["type_name1","type_name2",...,"type_namen"],
                    "data" : ["data1","data2",...,"datan"],
                    "mess" : "get data success"
                }
        4.2.2 备选流
            (1) sql查询错误，返回报文
                {
                    "success" : false,
                    "data_type" : [],
                    "data" : [],
                    "mess" : "get data false"
                }
    4.3 特殊需求
        无
    4.4 前置条件
        用户打开某个页面，客户端自动触发
    4.5 后置条件
        客户端完成加载，显示页面信息给用户
    4.6 扩展性
        无
```

