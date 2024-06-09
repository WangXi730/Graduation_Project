from PySide6.QtWidgets import QLabel,QSpinBox,QApplication, QMainWindow, QVBoxLayout, QWidget, QLineEdit, QPushButton, QGridLayout
from network import net_game_list,net_download_game
import math


class GameList(QMainWindow):
    def __init__(self,parent=None):
        self.game_list = []
        super().__init__(parent)
        self.parent = parent
        self.initUI()

    def initUI(self):
        self.setWindowTitle("game list")
        self.setMinimumSize(400, 300)

        # 创建上半部分的部件
        self.top_widget = QWidget()
        self.top_layout = QGridLayout()
        self.top_widget.setLayout(self.top_layout)

        # 创建下半部分的部件
        self.bottom_widget = QWidget()
        self.bottom_layout = QVBoxLayout()
        self.bottom_widget.setLayout(self.bottom_layout)

        # 创建主部件并将上半部分和下半部分添加到布局中
        main_widget = QWidget()
        main_layout = QVBoxLayout()
        main_layout.addWidget(self.top_widget)
        main_layout.addWidget(self.bottom_widget)
        main_widget.setLayout(main_layout)

        # 将主部件设置为主窗口的中央部件
        self.setCentralWidget(main_widget)

        # 创建文本框和下载按钮
        self.text_edits = []
        self.download_buttons = []
        for row in range(10):
            text_edit = QLineEdit()
            text_edit.setReadOnly(True)
            self.text_edits.append(text_edit)

            download_button = QPushButton("下载")
            download_button.clicked.connect(self.download)
            self.download_buttons.append(download_button)

            self.top_layout.addWidget(text_edit, row, 0)
            self.top_layout.addWidget(download_button, row, 1)

        # 创建只读文本框
        self.output_text_edit = QLineEdit()
        self.output_text_edit.setReadOnly(True)
        self.bottom_layout.addWidget(self.output_text_edit)

        # 创建页码控制组件和输入框
        self.page_label = QLabel("页码:")
        self.page_spinbox = QSpinBox()
        self.page_spinbox.setMinimum(1)
        self.page_spinbox.setMaximum(10)
        self.page_spinbox.valueChanged.connect(self.update_page)
        self.input_edit = QLineEdit()
        self.input_edit.returnPressed.connect(self.print_output)

        # 将页码控制组件和输入框添加到下半部分的布局中
        self.bottom_layout.addWidget(self.page_label)
        self.bottom_layout.addWidget(self.page_spinbox)
        self.bottom_layout.addWidget(self.input_edit)

    def download(self):
        button = self.sender()
        index = self.download_buttons.index(button)

        # 获取当前所在页
        page = self.page_spinbox.value()
        if page > 0:
            # 获取当前所在位置
            index = (page - 1) + index
            if index < len(self.game_list):
                net_download_game(self.game_list[index][1])

    def update_page(self):
        page = self.page_spinbox.value()
        # 展示这一页应该展示的
        # 首先，求出这一页的首行信息是第几个游戏
        index0 = (page-1) * 10
        # 展示信息
        print(f'{len(self.game_list)},{index0}')
        for i in range(min(len(self.game_list) - index0, 10)):
            self.text_edits[i].setText(self.game_list[index0 + i][0])


    def print_output(self):
        input_text = self.input_edit.text()
        id = self.parent.userid
        self.parent.session_id,self.game_list = net_game_list(id,self.parent.session_id,input_text)

        # 显示匹配结果的数量
        page_count = len(self.game_list) / 10
        if page_count != math.ceil(page_count):
            page_count = math.ceil(page_count)
        self.output_text_edit.setText(f'一共{page_count}页')

        self.update_page()



if __name__ == '__main__':
    app = QApplication([])
    window = GameList()
    window.show()
    app.exec()
