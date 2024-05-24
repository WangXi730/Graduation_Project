from PySide6.QtWidgets import QApplication, QWidget, QVBoxLayout, QFormLayout, QLabel, QLineEdit, QPushButton
from logon import Logon
from login import Login

class Begin(QWidget):
    def __init__(self):
        super().__init__()

        self.setWindowTitle("Begin")
        self.setFixedSize(300, 200)  # 设置窗口大小为300x200

        # 创建布局
        layout = QVBoxLayout()

        # 创建表单布局
        form_layout = QFormLayout()

        # 创建注册按钮
        logon_button = QPushButton("注册")
        logon_button.clicked.connect(self.open_logon)
        layout.addWidget(logon_button)

        # 创建登录按钮
        login_button = QPushButton("登录")
        login_button.clicked.connect(self.open_login)
        layout.addWidget(login_button)

        # 将表单布局添加到主布局中
        layout.addLayout(form_layout)

        # 创建消息标签
        self.message_label = QLabel()
        layout.addWidget(self.message_label)

        # 将布局设置为窗口的布局
        self.setLayout(layout)

    def open_logon(self):
        self.hide()
        logon_window = Logon(self)
        logon_window.exec_()
        self.show()

    def open_login(self):
        self.hide()
        login_window = Login(self)
        login_window.exec_()
        self.show()


if __name__ == "__main__":
    app = QApplication([])
    window = Begin()
    window.show()
    app.exec()