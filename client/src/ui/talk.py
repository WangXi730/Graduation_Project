from PySide6.QtWidgets import QApplication,QDialog, QMainWindow, QTextEdit, QLineEdit, QVBoxLayout, QWidget
from PySide6.QtCore import Qt

class Talk(QMainWindow):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.initUI()

    def initUI(self):
        self.setWindowTitle("文本框示例")
        self.setMinimumSize(400, 300)

        # 创建小文本框和大文本框
        self.small_text_edit = QLineEdit()
        self.large_text_edit = QTextEdit()
        self.large_text_edit.setReadOnly(True)

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

    def update_large_text_edit(self):
        # 获取小文本框的内容
        text = self.small_text_edit.text()

        # 清空小文本框的内容
        self.small_text_edit.clear()

        # 在大文本框中显示内容
        self.large_text_edit.append(text)

if __name__ == "__main__":
    app = QApplication([])
    window = Talk()
    window.show()
    app.exec()