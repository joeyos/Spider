#Python35 爬虫 西电研究生教务处 成绩查询
#肖洒 2017/02/01 V1.0
# -*-encoding:utf-8-*-
#注：请修改login()学号密码进行爬取
# coding=utf-8
import requests
import csv
from bs4 import BeautifulSoup
import pymysql
import re
class ScrapeGrade:
    def __init__(self, auth_url=None, log_url=None):
        if not auth_url:
            self.auth_url = "http://ids.xidian.edu.cn/authserver/login?service=http%3A%2F%2Fjwxt.xidian.edu.cn%2Fcaslogin.jsp"
            self.log_url = "http://jwxt.xidian.edu.cn/caslogin.jsp"
        else:
            self.auth_url = auth_url
            self.log_url = log_url
        self.session = requests.Session()

    def login(self, id='1601120338', password='113411'):
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
           # "Host": "ids.xidian.edu.cn",
           "Accept-Language": "zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3",
           "Accept-Encoding": "gzip, deflate",
           "Referer": "http://ids.xidian.edu.cn/authserver/login?service=http%3A%2F%2Fjwxt.xidian.edu.cn%2Fcaslogin.jsp",
           # 'X-Requested-With': "XMLHttpRequest",
           "Content-Type": "application/x-www-form-urlencoded"}
        s = self.session.post(self.auth_url, data=params, headers=headers)
        s = self.session.get(self.log_url)

    def Print(self):
        grade_page = self.session.get("http://yjsxt.xidian.edu.cn/student/index.jsp")
        bsObj = BeautifulSoup(grade_page.text, "html.parser")

        table = bsObj.findAll("table",{"class":"tab"})[0]

        rows = table.findAll("tr")


        csvFile = open('./student.csv', 'w',encoding = 'utf-8')
        writer = csv.writer(csvFile)
        writer.writerow(('姓名','学号','培养单位','入学年月','录取方式' ,'专业','研究方向','导师','已完成总学分','学位课加权平均分'))
        csvRow = []

        try:
            for row in rows:
                for cell in row.findAll('td'):
                    csvRow.append(cell.get_text().strip())

            writer.writerow(csvRow)


        finally:
            csvFile.close()

    def saveMysql(self):
        csvFile1 = open('./student.csv', 'r', encoding='utf-8')
        reader = csv.DictReader(csvFile1)

        for e in reader:
        	#连接到数据库
            connection = pymysql.connect(host='127.0.0.1', user='root', password='root', db='test12', charset='utf8',
                                         cursorclass=pymysql.cursors.DictCursor)
            # 执行sql语句
            try:
                with connection.cursor() as cursor:
                    sql = "insert into `student`(`id`,`name`,`academy`,`enrollmentdate`,`major`,`advisor`)values(%s,%s,%s,%s,%s,%s)"
                    # 使用 execute()  方法执行 SQL 查询 
                    cursor.execute(sql, (
                    e['学号'].strip(), e['姓名'].strip(),e['培养单位'].strip(), e['入学年月'].strip(), e['专业'].strip(), e['导师'].strip(), ))

                    connection.commit()
            finally:
  
                connection.close()
            # 执行sql语句

            ##修改
            

if __name__ == '__main__':
    # 初始化爬虫对象
    sg = ScrapeGrade()
    # 登录(在此处传入正确的个人学号与密码信息)
    sg.login(id='1601120338', password='113411')
    sg.Print()
    sg.saveMysql()