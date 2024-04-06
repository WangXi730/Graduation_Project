from datetime import datetime


__all__ = {
    "log"
}

class Log(object):
    def error(self,data):
        print(f"[ERROR]: {data} [{datetime.now()}]")
    def info(self,data):
        print(f"[INFO]: {data} [{datetime.now()}]")
    def warning(self,data):
        print(f"[WARNING]: {data} [{datetime.now()}]")

log = Log()

