#Python35 爬虫 西电研究生教务处 成绩查询
#肖洒 2017/02/01 V1.0
# -*-encoding:utf-8-*-
#注：请修改login()学号密码进行爬取
# coding=utf-8
import requests
import csv
from bs4 import BeautifulSoup
import pymysql
import urllib.request
import urllib.parse
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
        csvFile = open('./course2.csv', 'w', encoding='utf-8')
        for i in range(1,98):
            url1 = 'http://yjsxt.xidian.edu.cn/pub/'
            url2 = 'findTeachingCourseAction.do?studentID=&isUse=%CA%C7&departmentID=&d-16544-p='
            url3 = '&flag=select&isPublic=&courseLevelCode='
            URL  = url1+url2+str(i)+url3
            print(URL)

            s = self.session.get(URL)

            bsObj = BeautifulSoup(s.text, "html.parser")


            table = bsObj.findAll("table",{"class":"row"})[0]


            rows = table.findAll("thead")[0]
            tablerow = rows.findAll("th",{"class":"sortable"})
            table1 = []
            for each in tablerow:
                table1.append(each.get_text().strip())


            writer = csv.writer(csvFile)
            if i is 1:
                writer.writerow(table1)

            rowss = table.findAll("tr")

            for row in rowss:
                csvRow = []

                for cell in row.findAll('td'):
                    csvRow.append(cell.get_text().strip())
                writer.writerow(csvRow)

        csvFile.close()

    def saveMysql(self):
        csvFile1 = open('./course2.csv', 'r', encoding='utf-8')
        reader = csv.DictReader(csvFile1)

        for e in reader:

            if e['课程名称'] == '激光探测技术':
                 e['任课教师'] = '冯喆珺'

            if e['是否公共课'] == '是':
                e['是否公共课'] = '0'
            else:
                e['是否公共课'] = '1'

            if e['课程名称'] == '线性统计模型' and e['任课教师'] == '周杰':
                print("test")
                e['课程编号'] = 'X09MS1004A'
            if e['课程名称'] == '空间物理学' and e['任课教师'] == '刘彦明':
                print("hgsfadytfa")
                e['课程编号'] = 'X35SS0001A'
            if e['课程名称'] == '空间物理学' and e['课程层次'] == '硕士课':
                e['课程编号'] = 'X35SS0001B'
            if e['课程名称'] == '高等数理统计' and e['任课教师'] == '王亮':
                e['课程编号'] = 'Z02MS1001B'
            if e['课程名称'] == '时间序列分析' and e['任课教师'] == '' :
                #a = re.compile(r'^z')
                b = re.match('Z',e['课程编号'])
                if(b != None):
                    e['课程编号']= 'Z02MS1104A'
                    print("asdgggggggggadggggg")

            if e['课程名称'] == '统计学案例与分析' and e['任课教师'] == '冶继民':
                e['课程编号'] = 'Z02MS1111A'
            if e['课程名称'] == '独立分量分析' and e['任课教师'] == '':
                e['课程编号'] = 'Z02MS1213A'
                print(e['课程编号'])
            if e['课程名称'] == '统计分析报告写作' and e['任课教师'] == '冶继民':

                e['课程编号'] = 'Z02MS1230A'

            #print(e)



            connection = pymysql.connect(host='127.0.0.1', user='root', password='root', db='xd', charset='utf8',
                                         cursorclass=pymysql.cursors.DictCursor)

            try:
                with connection.cursor() as cursor:
                    sql = "insert into `course`(`course_id`,`course_name`,`courselevel`,`degree_course`,`period`,`credit`,`academy`,`term`,`classroom`)""values(%s,%s,%s,%s,%s,%s,%s,%s,%s)"


                    cursor.execute(sql, (
                    e['课程编号'].strip(), e['课程名称'].strip(),e['课程层次'].strip(), int(e['是否公共课'].strip()), float(e['学时']),float(e['学分']),e['开课单位'].strip(),"",""))

                    connection.commit()
            finally:

                connection.close()

if __name__ == '__main__':
    # 初始化爬虫对象
    sg = ScrapeGrade()
    # 登录(在此处传入正确的个人学号与密码信息)
    sg.login(id='1601120338', password='1134')
    sg.Print()
    sg.saveMysql()
