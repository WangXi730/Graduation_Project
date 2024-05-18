import shutil
import datetime
import sys
import os
import pytz
from apscheduler.schedulers.background import BlockingScheduler
import time


scheduler = BlockingScheduler(timezone=pytz.timezone("Asia/Shanghai"))

# 切割日志
@scheduler.scheduled_job("cron", hour=1, minute=0, second=0)
def split_log_file():
    size = len('task/cron_cut_log.py')
    cur_pro_dir = sys.argv[0][:-size]
    
    current_time = datetime.datetime.now()
    log_file = f"/{cur_pro_dir}/logs/uvicorn.log"
    backup_file = f"/{cur_pro_dir}/logs/logfile_{current_time.strftime('%Y%m%d%H%M%S')}.log"

    # 备份当前日志文件
    shutil.move(log_file, backup_file)

    # 创建新的空日志文件
    open(log_file, 'a').close()

# 清理超过7天的日志文件
@scheduler.scheduled_job("cron", hour=2, minute=0, second=0)
def clear_log_file():
    size = len('task/cron_cut_log.py')
    cur_pro_dir = sys.argv[0][:-size]
    log_dir = f"/{cur_pro_dir}/logs/"
    log_file_list = os.listdir(log_dir)
    for log_file in log_file_list:
        if log_file.startswith('logfile_'):
            log_file_time = log_file[8:-4]
            log_file_time = datetime.datetime.strptime(log_file_time, '%Y%m%d%H%M%S')
            if (datetime.datetime.now() - log_file_time).days > 7:
                os.remove(log_dir + log_file)


# 调用函数执行日志切割
scheduler.start()