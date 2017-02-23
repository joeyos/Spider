#Python35 爬虫 西电研究生教务处 成绩查询
#肖洒 2017/02/01 V1.0
# -*-encoding:utf-8-*-
# coding=utf-8
import requests
import csv
from bs4 import BeautifulSoup

class ScrapeGrade:
    def __init__(self, auth_url=None, log_url=None):
        if not auth_url:
            self.auth_url = "http://zfw.xidian.edu.cn/site/index"
            self.log_url = "http://zfw.xidian.edu.cn"
        else:
            self.auth_url = auth_url
            self.log_url = log_url
        self.session = requests.Session()

    def login(self, id='1601120338', password='xaut3120432040'):
        r = self.session.get(self.auth_url)
        data = r.text
        bsObj = BeautifulSoup(data, "html.parser")
        _csrf_value = bsObj.find(attrs={"name": "_csrf"})['value']

        #验证码识别
        image = Image.open(‘vcode.gif’)
        vcode = pytesseract.image_to_string(image)
        print(vcode)


        # exe_value = bsObj.find(attrs={"name": "execution"})['value']
        params = {'LoginForm[username]': id, 'LoginForm[password]': password,
                  "login-button": "", "_csrf": _csrf_value, 
                  # "execution": exe_value,
                  # "_eventId": "submit", "rmShown": '1'
                  }
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

        csvFile = open('./Liuliang.csv', 'w',encoding = 'utf-8')
        writer = csv.writer(csvFile)

        try:
            for row in rows:
                csvRow = []
                for cell in row.findAll('td'):
                    csvRow.append(cell.get_text())
                writer.writerow(csvRow)
        finally:
            csvFile.close()


if __name__ == '__main__':
    # 初始化爬虫对象
    sg = ScrapeGrade()
    # 登录(在此处传入正确的个人学号与密码信息)
    sg.login(id='1601120338', password='113411')
    sg.Print()