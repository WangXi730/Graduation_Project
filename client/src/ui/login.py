from PySide6.QtCore import Signal
from PySide6.QtWidgets import QApplication,QDialog, QWidget, QVBoxLayout, QFormLayout, QLabel, QLineEdit, QPushButton
from friends import MainWindow
from game_list import GameList
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
        self.username_textbox = QLineEdit()
        form_layout.addRow("账号", self.username_textbox)

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

    def show_message(self):
        username = self.username_textbox.text()
        password = self.password_textbox.text()
        message = f"用户名：{username}，密码：{password}"
        self.message_label.setText(message)
        self.choose = Choose()
        self.choose.show()


class Choose(QWidget):
    def __init__(self):
        super().__init__()

        self.game_list_button = QPushButton("游戏列表")
        self.game_list_button.clicked.connect(self.open_game_list)

        self.friend_list_button = QPushButton("好友列表")
        self.friend_list_button.clicked.connect(self.open_friend_list)

        layout = QVBoxLayout()
        layout.addWidget(self.game_list_button)
        layout.addWidget(self.friend_list_button)

        self.setLayout(layout)

    def open_game_list(self):
        self.game_list = GameList()
        self.game_list.show()

    def open_friend_list(self):
        self.friend_list = MainWindow()
        self.friend_list.show()

if __name__ == "__main__":
    app = QApplication([])
    window = Login()
    window.show()
    app.exec()