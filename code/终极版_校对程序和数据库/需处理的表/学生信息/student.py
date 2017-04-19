# coding:utf-8
import requests
import csv
from bs4 import BeautifulSoup
import pymysql
import re
import sys
import getopt
import codecs
import json


class XDspiderStudent:
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
            "http://yjsxt.xidian.edu.cn/student/index.jsp")


        bsObj = BeautifulSoup(grade_page.text, "html.parser")
        bsObj.encode('utf-8')
        table = bsObj.findAll("table", {"class": "tab"})[0]
        rows = table.findAll("tr")
        csvFile = file('./student.csv', 'wb')
        csvFile.write(codecs.BOM_UTF8)
        writer = csv.writer(csvFile)
        #writer.writerow([u'姓名', u'学号', u'培养单位', u'入学年月', u'录取方式',
                         #u'专业', u'研究方向', u'导师', u'已完成总学分', u'学位课加权平均分'])
        writer.writerow(('name', 'no', 'danwei', 'time', 'how',
                         'college', 'master', 'advisor', 'credit', 'score'))
        csvRow = []


        try:
            for row in rows:
                for cell in row.findAll('td'):
                    #print cell.get_text().strip()
                    csvRow.append(cell.get_text().strip().encode('utf-8'))
            writer.writerow(csvRow)



        finally:
            csvFile.close()


    def saveMysql(self,user_id,school_id,password):
        csvFile1 = codecs.open('./student.csv', 'r')

        reader = csv.DictReader(csvFile1)


        for e in reader:

            print e

        connection = pymysql.connect(host='127.0.0.1', user='root', password='root', db='xidian', charset='utf8',
                                     cursorclass=pymysql.cursors.DictCursor)
        # 执行sql语句
        # strip() 去除空格
        try:
            with connection.cursor() as cursor:
                sql = "insert into `student`(`user_id`,`school_id`,`stu_name`,`stu_number`,`stu_password`,`major`,`advisor`)values(%s,%s,%s,%s,%s,%s,%s)"
                # 使用 execute()  方法执行 SQL 查询
                cursor.execute(sql, (user_id, school_id, e['\xef\xbb\xbfname'].strip(), e['no'].strip(), password, e['college'].strip(),
                                     e['advisor'].strip()))
                connection.commit()
        finally:
            connection.close()



#Java调用时传递的参数格式[sno,password,stu_id,school_id]
if __name__ == '__main__':
    reload(sys)
    sys.setdefaultencoding('utf-8')
    print sys.getdefaultencoding()
    xs = XDspiderStudent()
    xs.login(sys.argv[0],sys.argv[1])
    xs.Store()
    xs.saveMysql(sys.argv[2],sys.argv[3],sys.argv[1])


