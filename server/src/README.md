server功能：<br>
接收两种种路由的post请求：/user、/manager<br><br>


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
                            "groups" : []
                    },
                    StatusCode: 0
                }
        1.2.2 备选流
            在基本流第2步中，可能出现查询结果不存在的情况，返回下面信息
                {
                    Response:{
                            "success" : false,
                            "mess" : "password error"
                            "groups" : []
                    }
                    StatusCode: 0
                }
            如果id不存在或者格式错误，返回下列信息
                {
                    Response:{
                            "success" : false,
                            "mess" : "id error"
                            "groups" : []
                    }
                    StatusCode: 0
                }
            如果获取session_id时多次出错导致最终耗时比较长，报错返回
                {
                    Response:{
                            "success" : false,
                            "mess" : "get session timeout"
                            "groups" : []
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
        在未来可能开发一些需要同步在线信息的能力，需要在登陆的时候全部返回给客户端
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
        之后可能在创建用户时创建其他数据表

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

5、好友列表
    5.1 简要说明
        用户操作好友列表，包含：发起好友意向，撤回好友意向，黑名单操作，分别对应 0，1，2。给每个用户配置一个表，用于存放他的好友信息，表的结构如下：
        '''
            CREATE TABLE {user_id}_friend (
                id BIGINT PRIMARY KEY,
                status VARCHAR(10),
            );
        '''
        status有3种状态：Intention，Request，Black
    5.2 事件流
        5.2.1 基本流
            (1) 客户端发起请求
                {
                    "Action" : "FriendList",
                    "id" : "1000000002",
                    "dest_id" : "1000000003",
                    "friendAction" : 0|1|2
                }
            (2) 服务器接收到信息，并且根据信息，操作涉及本次操作的两个用户
            (3) 服务器操作完成，返回
                {
                    "success" : true,
                    "mess" : ""
                }
        5.2.2 备选流
            数据库报错，返回信息
                {
                    "success" : false,
                    "mess" : "" 
                }
            目标用户不存在
                {
                    "success" : false,
                    "mess" : "dest_id not exist" 
                }
    5.3 特殊需求
        无
    5.4 前置条件
        用户处于登陆状态
    5.5 后置条件
        修改两个用户的好友列表信息
    5.6 扩展性
        无
6、创建群组（用于聊天）
    6.1 简要说明
        用户可以在一个群组中发送消息，群组的最小单位是至少有两个人，维护一张数据表来确定群组中存在哪些人，表结构如下：
            CREATE TABLE group_map (
                group_id BIGINT PRIMARY KEY,
                user_list TEXT,
                user_count SMALLINT
            );
        对于每一个群组，维护一张表来存储这个群组中的聊天记录，表结构如下：
            CREATE TABLE {group_id}_group (
                mess_id BIGINT PRIMARY KEY AUTO_INCREMENT,
                message TEXT,
                mess_user_id BIGINT,
                timestamp TIMESTAMP
            );
        创建每一个用户时，给每个用户增加一个所在群的表，这个表中存放群号，以及在群里的身份，身份暂时设置三种：普通用户（0级权限），管理员（1级权限），群主（2级权限）
        'CREATE TABLE {user_id}_groups (group_id BIGINT PRIMARY KEY, identity SMALLINT)'
    6.2 事件流
        基本流1：
            (1) 当一名用户添加另一名用户成功时，创建一个二人群组，新建聊天报文如下
            {                    
                "Action" : "CreateGroup",
                "id" : "1000000002",
                "dest_id" : "1000000003",
            }
            返回的报文如下
            {
                'success' : True
                'mess' : ...,
                'group_id' : 'xxxxx'
            }
            (2) 当用户打开群组时，显示最近的10条消息，用户可以往上翻
            (3) 当一名用户向另一名用户发送消息时，向数据表中插入一条数据
        基本流2：
            (1) 当一名用户主动发起群聊时，创建这些个目标用户的群聊
            {                    
                "Action" : "CreateGroup",
                "id" : "1000000002",
                "dest_id" : "1000000003;1000000004",
            }
            (2) 进入基本流1中的（2）
        备选流：
            消息发送失败，提醒用户
    6.3 特殊要求
        无
    6.4 前置条件
        主动创建群组的用户需要与所有群内用户皆为好友
    6.5 后置条件
        超过2人的群，所有会有一个群组列表，会出现在群组列表中
    6.6 扩展性
        或许可以有一个申请入群的功能
7、发送消息
    7.1 简要说明
        与之前一直使用的HTTP协议不同，这里就需要用到双向通信的协议了
        用户与用户之间通过协议进行聊天
    7.2 事件流
        基本流：
            (1) 用户a发送给服务器信息，格式是json，具体如下：
            message = {
                "Action" : "sendMessage" | "getMessage" | "heartBeat", # 发送消息和请求获取消息
                "group_id" : "xxxxxxx", # 要进行操作的群聊
                "sendMessage" : "", # 要发送的消息
                "getMessage" : {
                    "left" : "xxxx",# 最小id，可以为None
                    "right": "xxxx", # 最大id，可以为None
                    #如果全为空，默认返回最近的最多20条消息
                }
            }
            (2) 服务器接收到信息，查询当前群组中有哪些成员，查询这些成员中已经登陆的成员，将信息同步给已经登录的成员
            (3) 用户可以主动向服务器索要历史信息，用户需要向服务器提交一个表单，包含left，right两个数据，用户在登录的时候，默认会向服务器发送一个索要信息的请求，服务器会向用户给出的区间（left，right]的消息（最多20条，以right为准），如果right为None，则会传递最新的20条，如果服务器的消息不到20条，那么从left起，发送所有消息给客户端，为了节省消耗（时间和性能），客户端会存储一定的消息，在本地找不到的时候才会向服务器索要消息
        备选流：
            当客户端发送数据错误时，服务器会进行错误信息返回
    7.3 特殊要求
        无
    7.4 前置条件
        用户向服务器发送双向通信的请求
        用户向服务器发送索要信息的请求
    7.5 后置条件
        服务器向所有已经登陆的用户同步消息
        服务器向索要信息的用户返回相应的信息
    7.6 扩展性
        无
8、访问所有可下载的应用程序
    8.1 简要说明
        客户端获取可以下载的所有游戏的列表，给定一个参数page，代表返回的页，每页10个游戏
    8.2 事件流
        基本流
            (1) 客户端向服务器发送报文：
            {                    
                "Action" : "GetGame",
                "params" : {
                    "page" : n int,
                }
            }
            (2) 服务器向用户返回游戏的基本信息，以及下载链接，目前的想法是，基本信息包括：游戏名、文字描述以及一张图
            {
                Response:{
                        "success" : true,
                        "games" :[
                            {
                                "url" : "xxxxx",
                                "mess" : {
                                    "game_name" : "一款游戏",
                                    "some_text" : "这是一款游戏",
                                    "game_image" : "xxxxxxxx", # 二进制码，在客户端进行解析
                                },
                            },
                            ...
                        ]
                },
                StatusCode: 0
            }
    8.3 特殊要求
        无
    8.4 前置条件
        用户处于登陆状态，并且用户向服务器发送请求
    8.5 后置条件
        用户获取到一些游戏的基本信息
    8.6 扩展性
        无
```
2、/manager
