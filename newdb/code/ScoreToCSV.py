#Python35 爬虫 西电研究生教务处 成绩查询
#肖洒 2017/02/01 V1.0
# -*-encoding:utf-8-*-
#注：请修改login()学号密码进行爬取
# coding=utf-8
import requests
import csv
from bs4 import BeautifulSoup
import pymysql
class ScrapeGrade:
    def __init__(self, auth_url=None, log_url=None):
        if not auth_url:
            self.auth_url = "http://ids.xidian.edu.cn/authserver/login?service=http%3A%2F%2Fjwxt.xidian.edu.cn%2Fcaslogin.jsp"
            self.log_url = "http://jwxt.xidian.edu.cn/caslogin.jsp"
        else:
            self.auth_url = auth_url
            self.log_url = log_url
        self.session = requests.Session()

    def login(self, id='学号', password='密码'):
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
        grade_page = self.session.get("http://yjsxt.xidian.edu.cn/queryScoreByStuAction.do")
        bsObj = BeautifulSoup(grade_page.text, "html.parser")

        table = bsObj.findAll("table",{"class":"list_caption"})[0]
        rows = table.findAll("tr")


        csvFile = open('./Score.csv', 'w',encoding = 'utf-8')
        writer = csv.writer(csvFile)


        try:
            for row in rows:
                csvRow = []
                for cell in row.findAll('td'):
                    csvRow.append(cell.get_text())
                writer.writerow(csvRow)
            table1 = bsObj.findAll("table", {"class": "tab"})
            writer.writerow(table1)
        finally:
            csvFile.close()
    def saveMysql(self,id):
        sno = id
        csvFile1 = open('./Score.csv', 'r', encoding='utf-8')
        reader = csv.DictReader(csvFile1)

        for e in reader:

            print(e)
            #print(type(e['课程学分']))

            connection = pymysql.connect(host='127.0.0.1', user='root', password='root', db='xd', charset='utf8',
                                         cursorclass=pymysql.cursors.DictCursor)

            try:
                with connection.cursor() as cursor:
                    sql = "insert into `score`(`s_no`,`c_no`,`score`)values(%s,%s,%s)"
                    # sql = "insert into `xiaoxi`(`time`)values(%s)"

                    cursor.execute(sql, (
                    sno,e['课程编号'].strip(), e['成绩'].strip()))
                    # cursor.execute(sql, str(e['时间']))
                    connection.commit()
            finally:

                connection.close()


if __name__ == '__main__':
    # 初始化爬虫对象
    sg = ScrapeGrade()
    # 登录(在此处传入正确的个人学号与密码信息)
    sg.login(id='1601120338', password='113411')
    sg.Print()
    sg.saveMysql(id='1601120338')
