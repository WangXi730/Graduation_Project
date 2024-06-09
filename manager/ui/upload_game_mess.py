from PySide6.QtCore import Signal
from PySide6.QtWidgets import QApplication,QDialog, QWidget, QVBoxLayout, QFormLayout, QLabel, QLineEdit, QPushButton

from network import net_UploadGameMess

class UploadGameMess(QDialog):
    def __init__(self, parent=None):
        super().__init__(parent)

        self.setWindowTitle("上传游戏信息")
        self.setFixedSize(300, 200)  # 设置窗口大小为300x200

        # 创建布局
        layout = QVBoxLayout()

        # 创建表单布局
        form_layout = QFormLayout()

        # 创建用户名标签和文本框
        self.gamename_textbox = QLineEdit()
        form_layout.addRow("游戏名", self.gamename_textbox)

        # 创建密码标签和文本框
        self.url_textbox = QLineEdit()
        form_layout.addRow("游戏下载链接", self.url_textbox)

        # 将表单布局添加到主布局中
        layout.addLayout(form_layout)

        # 创建注册按钮
        send_mess_button = QPushButton("上传")
        send_mess_button.clicked.connect(self.send_mess_net)
        layout.addWidget(send_mess_button)

        # 创建消息标签
        self.message_label = QLabel()
        layout.addWidget(self.message_label)

        # 将布局设置为窗口的布局
        self.setLayout(layout)

    def send_mess_net(self):
        gamename = self.gamename_textbox.text()
        url = self.url_textbox.text()
        response = net_UploadGameMess(gamename,url)
        self.message_label.setText(f"{response}")

def main():
    app = QApplication([])
    window = UploadGameMess()
    window.show()
    app.exec()

if __name__ == "__main__":
    main()