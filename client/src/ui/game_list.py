from PySide6.QtWidgets import QLabel,QSpinBox,QApplication, QMainWindow, QVBoxLayout, QWidget, QLineEdit, QPushButton, QGridLayout

class GameList(QMainWindow):
    def __init__(self):
        super().__init__()
        self.initUI()

    def initUI(self):
        self.setWindowTitle("页面示例")
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
        self.input_edit.returnPressed.connect(self.print_input)

        # 将页码控制组件和输入框添加到下半部分的布局中
        self.bottom_layout.addWidget(self.page_label)
        self.bottom_layout.addWidget(self.page_spinbox)
        self.bottom_layout.addWidget(self.input_edit)

    def download(self):
        button = self.sender()
        index = self.download_buttons.index(button)
        text = self.text_edits[index].text()
        print(f"{text} 已下载")

    def update_page(self):
        page = self.page_spinbox.value()
        filename = f"file{page}.txt"
        with open(filename, "r") as file:
            content = file.read()
            for text_edit in self.text_edits:
                text_edit.setText(content)

    def print_input(self):
        text = self.input_edit.text()
        self.output_text_edit.setText(text)

if __name__ == '__main__':
    app = QApplication([])
    window = GameList()
    window.show()
    app.exec()
