from PySide6.QtWidgets import QApplication,QDialog, QMainWindow, QWidget, QVBoxLayout, QHBoxLayout, QListWidget, QTextEdit, QLineEdit, QPushButton, QInputDialog,QGroupBox, QMessageBox,QLabel
from ui.talk import Talk
from network import net_friend,net_get_friend,net_create_group
import sys
from PySide6.QtWidgets import QApplication, QWidget, QVBoxLayout, QHBoxLayout, QListWidget, QPushButton, QLabel, QGroupBox


class FriendList(QDialog):
    def __init__(self,parent):
        super().__init__(parent)
        self.parent = parent

        self.friend_list_widget = QListWidget()
        self.friend_list_widget.itemClicked.connect(self.show_friend_info)

        self.add_friend_button = QPushButton("添加好友")
        self.add_friend_button.clicked.connect(self.add_friend)

        self.delete_friend_button = QPushButton("删除好友")
        self.delete_friend_button.clicked.connect(self.delete_friend)

        self.block_friend_button = QPushButton("拉黑好友")
        self.block_friend_button.clicked.connect(self.block_friend)

        self.frind_request_button = QPushButton("好友申请")
        self.frind_request_button.clicked.connect(self.frind_request)

        layout = QVBoxLayout()
        layout.addWidget(self.friend_list_widget)
        layout.addWidget(self.add_friend_button)
        layout.addWidget(self.delete_friend_button)
        layout.addWidget(self.block_friend_button)
        layout.addWidget(self.frind_request_button)

        self.print_user_info = Info(self)
        self.init_friend_list()
        self.request_list_widger = FriendsRequest(self)

        self.setLayout(layout)

    def init_friend_list(self):
        # 获取好友列表
        self.parent.session_id,friend_list = net_get_friend(self.parent.session_id,self.parent.userid)
        # 初始化好友列表，在friend_list中，0是id，1是状态，2是名字
        self.Intention = [[user[0],user[2]] for user in friend_list if user[1]=='Intention']
        self.Request = [[user[0],user[2]] for user in friend_list if user[1]=='Request']
        self.Black = [[user[0],user[2]] for user in friend_list if user[1]=='Black']
        # 展示好友列表
        self.friend_list_widget.clear()
        for friend in self.Intention:
            self.friend_list_widget.addItem(friend[1])


    def show_friend_info(self, item):
        # 获取索引
        index = self.friend_list_widget.row(item)
        # 打印好友的基本信息
        self.print_user_info.updateTitleAndText(f'昵称：{self.Intention[index][1]}，账号：{self.Intention[index][0]}',"userinfo")
        self.print_user_info.show()

    def add_friend(self):
        friend_id, ok = QInputDialog.getText(self, "添加好友", "请输入好友ID:")
        if ok and friend_id:
            # 在网络上进行申请
            self.parent.session_id = net_friend(self.parent.session_id,self.parent.userid,friend_id,0)
            # 更新好友列表
            self.init_friend_list()

    def delete_friend(self):
        current_item = self.friend_list_widget.currentItem()
        if current_item:
            # 确定位置
            index = self.friend_list_widget.row(current_item)
            # 拿到id
            friend_id = self.Intention[index][0]
            # 在网络上进行申请
            self.parent.session_id = net_friend(self.parent.session_id,self.parent.userid,friend_id,1)
            # 更新好友列表
            self.init_friend_list()

    def block_friend(self):
        current_item = self.friend_list_widget.currentItem()
        if current_item:
            # 确定位置
            index = self.friend_list_widget.row(current_item)
            # 拿到id
            friend_id = self.Intention[index][0]
            # 在网络上进行申请
            self.parent.session_id = net_friend(self.parent.session_id,self.parent.userid,friend_id,2)
            # 更新好友列表
            self.init_friend_list()

    def frind_request(self):
        # print('好友申请列表')
        self.request_list_widger.show()


class Info(QDialog):
    def __init__(self,parent):
        super().__init__(parent)
        vbox = QVBoxLayout()
        mess = ''
        self.label = QLabel(mess, self)
        vbox.addWidget(self.label)
        self.setLayout(vbox)

    def updateTitleAndText(self, new_text, title):
        # 更新标签文本
        self.label.setText(new_text)
        self.setWindowTitle(title)


class FriendsRequest(QDialog):
    def __init__(self,parent):
        super().__init__(parent)
        self.parent = parent
        self.initUI()

    def initUI(self):
        # 创建主布局
        vbox = QVBoxLayout()

        # 创建列表
        self.listWidget = QListWidget()
        self.listWidget.addItems([self.parent.Request[i][1] for i in range(len(self.parent.Request))])
        vbox.addWidget(self.listWidget)

        # 创建按钮布局
        self.hbox = QHBoxLayout()

        # 创建按钮
        self.btn1 = QPushButton("通过", self)
        self.btn2 = QPushButton("拒绝", self)
        self.btn3 = QPushButton("拉黑", self)

        # 按钮关联函数
        self.btn1.clicked.connect(self.accept_friend)

        self.btn2.clicked.connect(self.delete_friend)

        self.btn3.clicked.connect(self.block_friend)

        # 将按钮添加到按钮布局
        self.hbox.addWidget(self.btn1)
        self.hbox.addWidget(self.btn2)
        self.hbox.addWidget(self.btn3)

        # 将按钮布局添加到主布局
        vbox.addLayout(self.hbox)

        # 设置窗口布局
        self.setLayout(vbox)

        self.setWindowTitle("请求列表")

    def accept_friend(self):
        current_item = self.listWidget.currentItem()
        if current_item:
            # 确定位置
            index = self.listWidget.row(current_item)
            # 拿到id
            friend_id = self.parent.Request[index][0]
            # 在网络上进行申请
            self.parent.parent.session_id = net_friend(self.parent.parent.session_id,self.parent.parent.userid,friend_id,0)
            # 更新好友列表
            self.parent.init_friend_list()
            # 更新请求列表
            self.listWidget.clear()
            self.listWidget.addItems([self.parent.Request[i][1] for i in range(len(self.parent.Request))])

    def delete_friend(self):
        current_item = self.listWidget.currentItem()
        if current_item:
            # 确定位置
            index = self.listWidget.row(current_item)
            # 拿到id
            friend_id = self.parent.Request[index][0]
            # 在网络上进行申请
            self.parent.parent.session_id = net_friend(self.parent.parent.session_id,self.parent.parent.userid,friend_id,1)
            # 更新好友列表
            self.parent.init_friend_list()
            # 更新请求列表
            self.listWidget.clear()
            self.listWidget.addItems([self.parent.Request[i][1] for i in range(len(self.parent.Request))])

    def block_friend(self):
        current_item = self.listWidget.currentItem()
        if current_item:
            # 确定位置
            index = self.listWidget.row(current_item)
            # 拿到id
            friend_id = self.parent.Request[index][0]
            # 在网络上进行申请
            self.parent.parent.session_id = net_friend(self.parent.parent.session_id,self.parent.parent.userid,friend_id,2)
            # 更新好友列表
            self.parent.init_friend_list()
            # 更新请求列表
            self.listWidget.clear()
            self.listWidget.addItems([self.parent.Request[i][1] for i in range(len(self.parent.Request))])

class ChatList(QWidget):
    def __init__(self,friend_list):
        super().__init__()
        self.friend_list = friend_list
        self.add_chat_widget = AddChat(self)

        self.chat_list = QListWidget()
        self.chat_list.addItems([f'{key}({value[1]})' for key,value in self.friend_list.parent.groups.items()])
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
        print("add_chat")
        self.add_chat_widget.show()



class AddChat(QDialog):
    def __init__(self,parent):
        super().__init__(parent)
        self.parent = parent
        self.info = Info(self)
        self.initUI()

    def initUI(self):
        # 创建主布局
        vbox = QVBoxLayout()

        # 创建水平布局用于放置两个带标题的 QListWidget
        hbox = QHBoxLayout()

        # 创建左边的 QListWidget 和标题
        self.leftListWidget = QListWidget()
        self.leftListWidget.addItems([f'{self.parent.friend_list.Intention[i][1]}({self.parent.friend_list.Intention[i][0]})' for i in range(len(self.parent.friend_list.Intention))])

        leftGroupBox = QGroupBox("好友列表")
        leftLayout = QVBoxLayout()
        leftLayout.addWidget(self.leftListWidget)
        leftGroupBox.setLayout(leftLayout)

        # 创建右边的 QListWidget 和标题
        self.rightListWidget = QListWidget()
        rightGroupBox = QGroupBox("聊天成员")
        rightLayout = QVBoxLayout()
        rightLayout.addWidget(self.rightListWidget)
        rightGroupBox.setLayout(rightLayout)

        # 将两个带标题的 QListWidget 添加到水平布局中
        hbox.addWidget(leftGroupBox)
        hbox.addWidget(rightGroupBox)

        # 将水平布局添加到主布局中
        vbox.addLayout(hbox)

        # 创建一个按钮并添加到主布局中
        self.button = QPushButton('创建', self)
        self.button.clicked.connect(self.create_group)
        vbox.addWidget(self.button)

        # 设置窗口布局
        self.setLayout(vbox)

        # 连接信号和槽函数
        self.leftListWidget.itemClicked.connect(self.moveItemToRight)
        self.rightListWidget.itemClicked.connect(self.moveItemToLeft)

        self.setWindowTitle('创建聊天')

    def moveItemToRight(self, item):
        # 从左边 QListWidget 删除项并添加到右边 QListWidget
        self.leftListWidget.takeItem(self.leftListWidget.row(item))
        self.rightListWidget.addItem(item.text())

    def moveItemToLeft(self, item):
        # 从右边 QListWidget 删除项并添加到左边 QListWidget
        self.rightListWidget.takeItem(self.rightListWidget.row(item))
        self.leftListWidget.addItem(item.text())

    def create_group(self):
        #组织信息
        item_count = self.rightListWidget.count()
        userlist = []
        for index in range(item_count):
            item = self.rightListWidget.item(index)
            userlist.append(item.text()[item.text().rfind('(')+1:-1])
        user = self.parent.friend_list.parent
        self.parent.friend_list.parent.session_id,group_id,mess,success = net_create_group(user.session_id,user.userid,userlist)
        text = ""
        if success:
            text = f"群号：{group_id}"
        else:
            text = mess
        self.info.updateTitleAndText(text,'mess')
        self.info.show()

class MainWindow(QMainWindow):
    def __init__(self,parent=None):
        super().__init__(parent)

        self.friend_list = FriendList(parent)
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