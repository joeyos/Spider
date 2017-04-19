# coding=utf-8
import codecs

import requests
import csv
from bs4 import BeautifulSoup
import pymysql
import re
import sys


class XDspiderKeBiao:
    def __init__(self, auth_url=None, log_url=None):
        if not auth_url:
            # 登录界面 post
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
        # 登录所需信息
        lt_value = bsObj.find(attrs={"name": "lt"})['value']
        exe_value = bsObj.find(attrs={"name": "execution"})['value']
        params = {'username': id, 'password': password,
                  "submit": "", "lt": lt_value, "execution": exe_value,
                  "_eventId": "submit", "rmShown": '1'}
        # 模拟登录报头
        headers = {'User-Agent': "Mozilla/5.0 (Windows NT 10.0; WOW64; rv:44.0) Gecko/20100101 Firefox/44.0",
                   'Accept': "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
                   "Accept-Language": "zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3",
                   "Accept-Encoding": "gzip, deflate",
                   "Referer": "http://ids.xidian.edu.cn/authserver/login?service=http%3A%2F%2Fjwxt.xidian.edu.cn%2Fcaslogin.jsp",
                   "Content-Type": "application/x-www-form-urlencoded"}
        s = self.session.post(self.auth_url, data=params, headers=headers)
        s = self.session.get(self.log_url)
    # 将爬取的数据存为CSV文件

    def Store(self):
        grade_page = self.session.get(
            "http://yjsxt.xidian.edu.cn/queryScoreByStuAction.do")
        bsObj = BeautifulSoup(grade_page.text, "html.parser")

        table = bsObj.findAll("table", {"class": "list_caption"})[0]
        bsObj.encode('utf-8')
        rows = table.findAll("tr")[1:]

        csvFile = file('./Score.csv', 'w')
        csvFile.write(codecs.BOM_UTF8)
        writer = csv.writer(csvFile)

        writer.writerow(('term', 'c_no', 'c_name', 'credits',
                         'is_degree', 'score', 'gain_credits', 'remark'))
        csvRow = []

        try:
            for row in rows:
                csvRow = []
                for cell in row.findAll('td'):
                    csvRow.append(cell.get_text().strip().encode('utf-8'))
                writer.writerow(csvRow)
        finally:
            csvFile.close()

    # 将CSV文件存入MySQL
    def saveMysql(self,stu_id):
        csvFile1 = codecs.open('./Score.csv', 'r')
        reader = csv.DictReader(csvFile1)

        for e in reader:
            if e['is_degree'] == '是':
                e['is_degree'] = 1
            else:
                e['is_degree'] = 0
            if e['score'] == '':
                e['score'] = ' '
            if e['gain_credits'] == '':
                e['gain_credits'] = ' '
            print(e)
            # 连接到数据库

            connection = pymysql.connect(host='127.0.0.1', user='root', password='root', db='xidian', charset='utf8',
                                         cursorclass=pymysql.cursors.DictCursor)
            # 执行sql语句
            # strip() 去除空格
            try:
                with connection.cursor() as cursor:
                    sql = "insert into `score`(`stu_id`,`sc_number`,`sc_name`,`credits`,`is_degree`,`score`,`credits_get`,`note`)values(%s,%s,%s,%s,%s,%s,%s,%s)"
                    # 使用 execute()  方法执行 SQL 查询

                    cursor.execute(sql, (
                        stu_id, e['c_no'].strip(), e['c_name'].strip(), e['credits'].strip(), e['is_degree'], e['score'], e['gain_credits'], e['remark'].strip()))
                    connection.commit()
            finally:
                connection.close()

#Java调用时传递的参数格式[sno,password,stu_id]
if __name__ == '__main__':
    reload(sys)
    sys.setdefaultencoding('utf-8')
    # 初始化爬虫对象
    XD = XDspiderKeBiao()
    # 登录(在此处传入正确的个人学号与密码信息)
    XD.login(sys.argv[0], sys.argv[1])
    XD.Store()
    XD.saveMysql(sys.argv[2])
