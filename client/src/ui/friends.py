from PySide6.QtWidgets import QApplication, QMainWindow, QWidget, QVBoxLayout, QHBoxLayout, QListWidget, QTextEdit, QLineEdit, QPushButton, QInputDialog, QMessageBox
from talk import Talk

class FriendList(QWidget):
    def __init__(self):
        super().__init__()

        self.friend_list_widget = QListWidget()
        self.friend_list_widget.itemClicked.connect(self.show_friend_info)

        self.add_friend_button = QPushButton("添加好友")
        self.add_friend_button.clicked.connect(self.add_friend)

        self.delete_friend_button = QPushButton("删除好友")
        self.delete_friend_button.clicked.connect(self.delete_friend)

        self.block_friend_button = QPushButton("拉黑好友")
        self.block_friend_button.clicked.connect(self.block_friend)

        layout = QVBoxLayout()
        layout.addWidget(self.friend_list_widget)
        layout.addWidget(self.add_friend_button)
        layout.addWidget(self.delete_friend_button)
        layout.addWidget(self.block_friend_button)

        self.setLayout(layout)

    def show_friend_info(self, item):
        friend = item.text()
        # 打印好友的基本信息
        self.print_friend_info(friend)

    def print_friend_info(self, friend):
        # 打印好友的基本信息的逻辑
        print("好友信息:", friend)

    def add_friend(self):
        friend, ok = QInputDialog.getText(self, "添加好友", "请输入好友名称:")
        if ok and friend:
            # 添加好友到列表
            self.friend_list_widget.addItem(friend)

    def delete_friend(self):
        current_item = self.friend_list_widget.currentItem()
        if current_item:
            friend = current_item.text()
            # 从列表中删除好友
            self.friend_list_widget.takeItem(self.friend_list_widget.row(current_item))

    def block_friend(self):
        current_item = self.friend_list_widget.currentItem()
        if current_item:
            friend = current_item.text()
            # 拉黑好友的逻辑
            self.block_friend_logic(friend)
            self.friend_list_widget.takeItem(self.friend_list_widget.row(current_item))

    def block_friend_logic(self, friend):
        # 拉黑好友的逻辑
        print("Blocking friend:", friend)

class ChatList(QWidget):
    def __init__(self,friend_list):
        super().__init__()
        self.friend_list = friend_list
        self.chat_list = QListWidget()
        self.chat_list.itemClicked.connect(self.enterChat)

        self.add_chat_button = QPushButton("创建聊天")
        self.add_chat_button.clicked.connect(self.add_chat)

        layout = QVBoxLayout()
        layout.addWidget(self.chat_list)
        layout.addWidget(self.add_chat_button)

        self.setLayout(layout)

    def enterChat(self, item):
        group_name = item.text()
        group_talk = Talk(group_name=group_name,parent=self)
        group_talk.show()

    def add_chat(self):
        dest_friends, ok = QInputDialog.getText(self, "添加聊天", "请输入好友ID（用;分割）:")
        if ok and dest_friends:
            # 添加好友到列表
            # CreatGroup(dest_friends)
            self.chat_list.addItem(dest_friends)


class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()

        self.friend_list = FriendList()
        self.chat_list = ChatList(friend_list=self.friend_list)

        layout = QHBoxLayout()
        layout.addWidget(self.friend_list)
        layout.addWidget(self.chat_list)

        central_widget = QWidget()
        central_widget.setLayout(layout)
        self.setCentralWidget(central_widget)

if __name__ == '__main__':
    app = QApplication([])
    window = MainWindow()
    window.show()
    app.exec()