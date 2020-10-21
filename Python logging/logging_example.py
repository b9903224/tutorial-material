# -*- coding: utf-8 -*-
"""
Created on Wed Oct 21 23:29:12 2020

@author: b9903

ref: https://shian420.pixnet.net/blog/post/350291572-%5Bpython%5D-logging-%E5%B9%AB%E4%BD%A0%E7%B4%80%E9%8C%84%E4%BB%BB%E4%BD%95%E8%A8%8A%E6%81%AF
ref: https://stackoverflow.com/questions/7173033/duplicate-log-output-when-using-python-logging-module
"""

import logging
import os
from datetime import datetime

dir_path = 'D:/pythonProject/itkm/logger/logs/'   # 設定 logs 目錄
filename = "{:%Y-%m-%d}".format(datetime.now()) + '.log'     # 設定檔名

def create_logger(log_folder):
    # config
    logging.captureWarnings(True)   # 捕捉 py waring message
    formatter = logging.Formatter('%(asctime)s %(levelname)s %(message)s')
    my_logger = logging.getLogger('py.warnings')    # 捕捉 py waring message
    
    if len(logger.handlers):
        return my_logger
    
    my_logger.setLevel(logging.INFO)

    # 若不存在目錄則新建
    if not os.path.exists(dir_path+log_folder):
        os.makedirs(dir_path+log_folder)

    # file handler
#    fileHandler = logging.FileHandler(dir_path+log_folder+'/'+filename, 'w', 'utf-8')
    fileHandler = logging.FileHandler(dir_path+log_folder+'/'+filename, 'a', 'utf-8')
    fileHandler.setFormatter(formatter)
    my_logger.addHandler(fileHandler)

    # console handler
    consoleHandler = logging.StreamHandler()
    consoleHandler.setLevel(logging.DEBUG)
    formatter_console = logging.Formatter('%(message)s')
    consoleHandler.setFormatter(formatter_console)
    my_logger.addHandler(consoleHandler)

    return my_logger


#from logs.logger import create_logger
import requests
requests.packages.urllib3.disable_warnings()    # 關閉警告訊息

def main(logger):
    url = "https://tw.yahoo.com/"
    headers = {
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36'}
    results = requests.get(url, verify=False, headers=headers)
    results.encoding = 'utf-8'  # 修改編碼
    data = results.text
    logger.info(data)   # 將 yahoo html 記到 log file 中

if __name__ == '__main__':
    logger = create_logger('tutorial')  # 在 logs 目錄下建立 tutorial 目錄
    logger.info('Start \n')

    try:
        main(logger)
    except Exception as e:
        logger.exception("Runtime Error Message:")

    logger.info("Export Done! \n")