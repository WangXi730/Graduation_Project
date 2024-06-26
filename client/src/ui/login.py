from PySide6.QtCore import Signal
from PySide6.QtCore import QUrl
from PySide6.QtWebSockets import QWebSocket
from PySide6.QtWidgets import QApplication,QDialog, QWidget, QVBoxLayout, QFormLayout, QLabel, QLineEdit, QPushButton
from ui.friends import FriendList,MainWindow
from ui.game_list import GameList
from network import net_login,net_get_mess
import asyncio
import threading
import json


def run_async_function_in_thread(func):
    loop = asyncio.new_event_loop()
    asyncio.set_event_loop(loop)
    future = asyncio.ensure_future(func())
    loop.run_until_complete(future)
    loop.close()

class Login(QDialog):
    def __init__(self, parent=None):
        super().__init__(parent)

        self.setWindowTitle("Login")
        self.setFixedSize(300, 200)  # 设置窗口大小为300x200

        # 创建布局
        layout = QVBoxLayout()

        # 创建表单布局
        form_layout = QFormLayout()

        # 创建用户名标签和文本框
        self.userid_textbox = QLineEdit()
        form_layout.addRow("账号", self.userid_textbox)

        # 创建密码标签和文本框
        self.password_textbox = QLineEdit()
        self.password_textbox.setEchoMode(QLineEdit.Password)  # 设置密码文本框的echoMode属性
        form_layout.addRow("密码", self.password_textbox)

        # 将表单布局添加到主布局中
        layout.addLayout(form_layout)

        # 创建注册按钮
        logon_button = QPushButton("登录")
        logon_button.clicked.connect(self.show_message)
        layout.addWidget(logon_button)

        # 创建消息标签
        self.message_label = QLabel()
        layout.addWidget(self.message_label)

        # 将布局设置为窗口的布局
        self.setLayout(layout)

    def get_name(self):
        self.session_id,data = net_get_mess(self.session_id,self.userid,["username"])
        self.username = data[0]

    def show_message(self):
        # 获取用户输入
        self.userid = self.userid_textbox.text()
        self.password = self.password_textbox.text()

        # 进行网络操作
        session_id,url,groups = net_login(self.userid,self.password)
        if session_id is None:
            self.message_label.setText(url)
            return
        self.session_id = session_id
        self.groups = dict()
        for row in groups:
            self.groups[row['group_id']] = [row['identity'],row['user_list'],row['user_count']]
        # 群组 ： 消息，每个群组是一个dict，key是消息id，value是一个list大致如下：["你好","2024-05-28 03:26:25"]
        self.message_dict = dict()
        for group_id in self.groups.keys():
            self.message_dict[group_id] = dict()

        self.get_name()

        self.choose = Choose(self)
        self.choose.show()

    def on_message_received(self,mess):
        if mess == "heartBeat":
            return
        # 每次接收到消息，向对应的群组里增加发一条
        # @params mess  [[1,"你好",1000000000,"2024-05-28 03:26:25"],...]
        mess_list = json.loads(mess)
        for mess_one in mess_list:
            this_group = self.message_dict[mess_one[2]]
            this_group[mess_one[0]] = [mess_one[1],mess_one[3]]

class Choose(QDialog):
    def __init__(self,parent=None):
        super().__init__(parent)
        self.parent = parent

        self.game_list_button = QPushButton("游戏列表")
        self.game_list_button.clicked.connect(self.open_game_list)

        self.friend_list_button = QPushButton("好友列表")
        self.friend_list_button.clicked.connect(self.open_friend_list)

        layout = QVBoxLayout()
        layout.addWidget(self.game_list_button)
        layout.addWidget(self.friend_list_button)

        self.setLayout(layout)

    def open_game_list(self):
        self.game_list = GameList(self.parent)
        self.game_list.show()

    def open_friend_list(self):
        # self.friend_list = FriendList(self.parent)
        # self.friend_list.show()
        self.friend_main = MainWindow(self.parent)
        self.friend_main.show()

if __name__ == "__main__":
    app = QApplication([])
    window = Login()
    window.show()
    app.exec()