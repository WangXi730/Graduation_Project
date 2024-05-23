from PySide6.QtWidgets import QApplication,QDialog, QMainWindow, QTextEdit, QLineEdit, QVBoxLayout, QWidget
from PySide6.QtCore import Qt, Signal, QTime, QTimer


class Talk(QMainWindow):
    scroll_signal=Signal()
    def __init__(self, parent=None):
        super().__init__(parent)
        self.initUI()
        self.i = 1

    def initUI(self):
        self.setWindowTitle("文本框示例")
        self.setMinimumSize(400, 300)

        # 创建小文本框和大文本框
        self.small_text_edit = QLineEdit()
        self.large_text_edit = QTextEdit()
        self.large_text_edit.setReadOnly(True)

        # 大文本框的滚动到顶端触发
        self.large_text_edit.setVerticalScrollBarPolicy(Qt.ScrollBarAlwaysOn)
        self.large_text_edit.setLineWrapMode(QTextEdit.NoWrap)
        self.large_text_edit.textChanged.connect(self.check_scroll_position)
        self.scroll_bar = self.large_text_edit.verticalScrollBar()
        self.scroll_bar.valueChanged.connect(self.check_scroll_position)

        # 将小文本框的回车信号连接到处理函数
        self.small_text_edit.returnPressed.connect(self.update_large_text_edit)

        # 创建布局并将小文本框和大文本框添加到布局中
        layout = QVBoxLayout()
        layout.addWidget(self.large_text_edit)
        layout.addWidget(self.small_text_edit)

        # 创建一个主部件并将布局设置为主部件的布局
        widget = QWidget()
        widget.setLayout(layout)

        # 将主部件设置为主窗口的中央部件
        self.setCentralWidget(widget)

        self.scroll_signal.connect(self.get_mess)

    def update_large_text_edit(self):
        # 获取小文本框的内容
        text = self.small_text_edit.text()

        # 清空小文本框的内容
        self.small_text_edit.clear()

        # 在大文本框中显示内容
        self.large_text_edit.append(text)

    def check_scroll_position(self):
        if self.scroll_bar.value() == self.scroll_bar.minimum():  # 检查滚动条是否滚动到顶部
            self.scroll_signal.emit()  # 发出滚动到顶部的信号

    def get_mess(self):
        QTimer.singleShot(0,self.get_mess_behave)
    def get_mess_behave(self):
        cursor = self.large_text_edit.textCursor()
        cursor.setPosition(0)  # 将光标移动到文本的起始位置
        cursor.insertText(f"滚动到顶部{self.i}\n")  # 在文本的起始位置插入打印内容
        self.i += 1
        cursor.setPosition(cursor.End)

if __name__ == "__main__":
    app = QApplication([])
    window = Talk()
    window.show()
    app.exec()