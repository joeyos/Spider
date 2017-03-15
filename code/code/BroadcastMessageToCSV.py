#Python35 爬虫 西电研究生教务处 通知公告
#肖洒 2017/1/25 V1.0
#注：请修改login()学号密码进行爬取
# -*-encoding:utf-8-*-
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
        csvFile = open('./message.csv', 'w', encoding='utf-8')
        for i in range(1, 3):
            url1 = 'http://yjsxt.xidian.edu.cn/info/findAllBroadcastMessageAction.do?d-16544-p='
            url2 = '&flag=findAll'

            URL = url1 +  str(i)+ url2
            print(URL)

            s = self.session.get(URL)

            bsObj = BeautifulSoup(s.text, "html.parser")

            table = bsObj.findAll("table", {"class": "row"})[0]

            writer = csv.writer(csvFile)
            if i is 1:

                writer.writerow(('发布人','时间','标题','','具体内容',''))
            rows = table.findAll("tbody")[0]
            rowss = rows.findAll("tr")


            for row in rowss:
                csvRow = []


                for cell in row.findAll('li'):

                    csvRow.append(cell.get_text().strip())
                    #print(csvRow)
                writer.writerow(csvRow)

        csvFile.close()

    def saveMysql(self):
            csvFile1 = open('./message.csv', 'r', encoding='utf-8')
            reader = csv.DictReader(csvFile1)

            for e in reader:
                #print(e['发布人'][-5:])


                connection = pymysql.connect(host='127.0.0.1', user='root', password='root', db='xd', charset='utf8',
                                             cursorclass=pymysql.cursors.DictCursor)

                try:
                    with connection.cursor() as cursor:
                        sql = "insert into `xdxiaoxi`(`name`,`content`,`publisher`,`date`,`is_hot`)values(%s,%s,%s,%s,%s)"

                        cursor.execute(sql, (
                        e['标题'].strip(), e['具体内容'].strip(),e['发布人'][-5:], e['时间'].strip(), 0 ))

                        connection.commit()
                finally:

                    connection.close()

if __name__ == '__main__':
    # 初始化爬虫对象
    sg = ScrapeGrade()
    # 登录(在此处传入正确的个人学号与密码信息)
    sg.login(id='', password='')
    sg.Print()
    sg.saveMysql()