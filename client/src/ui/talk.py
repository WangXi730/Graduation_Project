from PySide6.QtWidgets import QApplication,QPushButton,QScrollBar,QDialog,QListWidget, QMainWindow, QTextEdit, QLineEdit, QVBoxLayout, QWidget
from PySide6.QtCore import Qt, Signal, QTime, QTimer
from network import WebSocketClient
import json

class Talk(QMainWindow,QDialog):
    def __init__(self, group_name=None, parent=None):
        super().__init__(parent)

        self.group_mess = dict()
        self.group_name = group_name
        self.group_id = group_name[:group_name.find('(')]
        self.group_user = group_name[group_name.find('(')+1:group_name.find(')')].split(';')
        self.friend_id_name = {}
        for friend in parent.friend_list.Intention:
            if str(friend[0]) in self.group_user:
                self.friend_id_name[friend[0]] = friend[1]

        self.parent = parent
        self.user = parent.friend_list.parent
        self.friend_id_name[int(self.user.userid)] = self.user.username

        self.client = WebSocketClient(self.user.userid,self.group_id)
        self.client.on_message = self.on_message
        self.initUI()

    # def check_scroll_position(self):
    #     if self.scroll_bar.value() == self.scroll_bar.minimum():  # 检查滚动条是否滚动到顶部
    #         self.scroll_signal.emit()  # 发出滚动到顶部的信号

    def initUI(self):
        self.setWindowTitle(self.group_name)
        self.setMinimumSize(400, 300)

        # 创建小文本框和大文本框
        self.small_text_edit = QLineEdit()
        self.large_text_edit = QListWidget()

        # 大文本框的滚轮
        self.scroll_bar = self.find_scrollbar(self.large_text_edit)

        # 获取历史数据按钮
        self.history_button = QPushButton("加载历史聊天记录")
        self.history_button.clicked.connect(self.get_mess)

        # 大文本框的滚动到顶端触发
        # self.large_text_edit.setVerticalScrollBarPolicy(Qt.ScrollBarAlwaysOn)
        # self.large_text_edit.setLineWrapMode(QTextEdit.NoWrap)
        # self.large_text_edit.textChanged.connect(self.check_scroll_position)
        # self.scroll_bar = self.large_text_edit.verticalScrollBar()
        # self.scroll_bar.valueChanged.connect(self.check_scroll_position)

        # 将小文本框的回车信号连接到处理函数
        self.small_text_edit.returnPressed.connect(self.update_large_text_edit)

        # 创建布局并将小文本框和大文本框添加到布局中
        layout = QVBoxLayout()
        layout.addWidget(self.history_button)
        layout.addWidget(self.large_text_edit)
        layout.addWidget(self.small_text_edit)

        # 创建一个主部件并将布局设置为主部件的布局
        widget = QWidget()
        widget.setLayout(layout)

        # 将主部件设置为主窗口的中央部件
        self.setCentralWidget(widget)

    def find_scrollbar(self, widget):
        for child in widget.children():
            if isinstance(child, QScrollBar) and child.orientation() == 1:  # Vertical scrollbar
                return child
        return None

    def is_scroll_at_bottom(self):
        if self.scroll_bar is not None:
            return self.scroll_bar.value() == self.scroll_bar.maximum()
        return False


    def update_large_text_edit(self):
        # 获取小文本框的内容
        text = self.small_text_edit.text()
        # 发送消息
        self.client.set_mess(text)
        # 清空小文本框的内容
        self.small_text_edit.clear()

    def on_message(self,message):
        # 对文本进行解析
        # text = json.loads(message)
        # 在大文本框中显示内容
        # self.large_text_edit.addItem(message)
        if message == '"heartBeat"':
            pass
        else:
            print(message)
            print(self.friend_id_name)
            mess_json = json.loads(message)
            mess_list = mess_json["mess"]
            # 查看它的id是否是这个群的
            mess_group_id = str(mess_json["group_id"])
            if mess_group_id == self.group_id:
                at_bottom = self.is_scroll_at_bottom()
                # 将消息插入到已有的队列中
                for mess in mess_list:
                    self.group_mess[mess[0]] = [mess[1],mess[2],mess[3]]
                # 更新列表
                self.large_text_edit.clear()
                value_list = [self.group_mess[key] for key in sorted(self.group_mess.keys())]
                for value in value_list:
                    text = f"""
[{value[2]}]
{self.friend_id_name[value[1]]}({value[1]}): 
    {value[0]}
                        """
                    self.large_text_edit.addItem(text)
                # 滚动到底部
                if at_bottom:
                    self.large_text_edit.scrollToBottom()

    def get_mess(self):
        if not self.group_mess:
            mess = {"left": None, "right": None}
            self.client.get_mess(mess)
        else:
            # 求出当前最小的id
            min_id = min(self.group_mess.keys())
            # 获取数据
            if min_id > 1:
                mess = {"left":None,"right":min_id-1}
                self.client.get_mess(mess)

    def close_connection(self):
        self.client.close()
        print("Connection closed")

    def closeEvent(self, event):
        print("Window is closing")
        self.close_connection()  # Close WebSocket connection
        event.accept()  # Accept the event and close the window

if __name__ == "__main__":
    app = QApplication([])
    window = Talk(group_name='1000000006(1000000074;1000000075;1000000076)')# 括号外的是群号，括号内的是聊天成员的id
    window.show()
    app.exec()