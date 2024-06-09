from ui.begin import Begin
from ui.logon import Logon
from ui.login import Login
from ui.friends import FriendList
from ui.game_list import GameList
from ui.talk import Talk
from PySide6.QtCore import Signal
from PySide6.QtWidgets import QApplication,QDialog, QWidget, QVBoxLayout, QFormLayout, QLabel, QLineEdit, QPushButton

def main():
    app = QApplication([])
    window = Begin()
    window.show()
    app.exec()

if __name__ == "__main__":
    main()

