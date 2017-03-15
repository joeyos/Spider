# Python35 西电研究生教务处 我的消息（系统消息、成绩提示等）爬虫
# Java调用请将学号密码参数传给sys.argv[1], sys.argv[2] 数据将存至MySQL
# 肖洒 2017/02/01 V1.0
# -*-encoding:utf-8-*-
# coding=utf-8
import requests
import csv
from bs4 import BeautifulSoup
import pymysql
import re
import sys


class XDMymessage:
    def __init__(self, auth_url=None, log_url=None):
        if not auth_url:
            self.auth_url = "http://ids.xidian.edu.cn/authserver/login?service=http%3A%2F%2Fjwxt.xidian.edu.cn%2Fcaslogin.jsp"
            self.log_url = "http://jwxt.xidian.edu.cn/caslogin.jsp"
        else:
            self.auth_url = auth_url
            self.log_url = log_url
        self.session = requests.Session()

    def login(self, id='', password=''):
        r = self.session.get(self.auth_url)
        data = r.text
        bsObj = BeautifulSoup(data, "html.parser")
        lt_value = bsObj.find(attrs={"name": "lt"})['value']
        exe_value = bsObj.find(attrs={"name": "execution"})['value']
        params = {'username': id, 'password': password,
                  "submit": "", "lt": lt_value, "execution": exe_value,
                  "_eventId": "submit", "rmShown": '1'}
        headers = {'User-Agent': "Mozilla/5.0 (Windows NT 10.0; WOW64; rv:44.0) Gecko/20100101 Firefox/44.0",
                   'Accept': "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
                   "Accept-Language": "zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3",
                   "Accept-Encoding": "gzip, deflate",
                   "Referer": "http://ids.xidian.edu.cn/authserver/login?service=http%3A%2F%2Fjwxt.xidian.edu.cn%2Fcaslogin.jsp",
                   "Content-Type": "application/x-www-form-urlencoded"}
        s = self.session.post(self.auth_url, data=params, headers=headers)
        s = self.session.get(self.log_url)

    def Store(self):
        grade_page = self.session.get(
            "http://yjsxt.xidian.edu.cn/info/findAllMessageAction.do")
        bsObj = BeautifulSoup(grade_page.text, "html.parser")

        table = bsObj.findAll("table", {"class": "row"})[0]
        rows = table.findAll("tr")

        csvFile = open('./Mymessage.csv', 'w', newline='', encoding='utf-8')
        writer = csv.writer(csvFile)

        writer.writerow(('消息类型', '内容'))
        csvRow = []

        try:
            for row in rows:
                csvRow = []
                for td in row.findAll('td')[1:]:
                    for li in td.findAll('li')[0::2]:
                        csvRow.append(li.get_text().strip().replace(' ', ''))
                    writer.writerow(csvRow)
        finally:
            csvFile.close()

    # 将CSV文件存入MySQL
    def saveMysql(self):
        csvFile1 = open('./Mymessage.csv', 'r', newline='', encoding='utf-8')
        reader = csv.DictReader(csvFile1)

        for e in reader:
            # 连接到数据库
            connection = pymysql.connect(host='127.0.0.1', user='root', password='root', db='test3', charset='utf8',
                                         cursorclass=pymysql.cursors.DictCursor)
            # 执行sql语句
            # strip() 去除空格
            try:
                with connection.cursor() as cursor:
                    sql = "insert into `mymessage`(`messagetype`,`content`)values(%s,%s)"
                    # 使用 execute()  方法执行 SQL 查询
                    cursor.execute(sql, (e['消息类型'].strip(), e['内容'].strip()))
                    connection.commit()
            finally:
                connection.close()


if __name__ == '__main__':
    # 初始化爬虫对象
    xm = XDMymessage()
    # 登录(在此处传入正确的个人学号与密码信息)
    xm.login(sys.argv[1], sys.argv[2])
    xm.Store()
    xm.saveMysql()
