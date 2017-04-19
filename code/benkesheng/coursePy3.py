# Python35 模拟登录西电本科生教务处-选课信息
# 2017/03/11 V1.0
# coding=utf-8

# 本科生教务处登录网址
# http://ids.xidian.edu.cn/authserver/login?service=http%3A%2F%2Fjwxt.xidian.edu.cn%2Fcaslogin.jsp
# 学号：14050120014 密码：081155

import requests
import csv
from bs4 import BeautifulSoup
import pymysql
import re


class XDspiderKeBiao:

  def __init__(self, auth_url=None, log_url=None):
    if not auth_url:
      self.auth_url = "http://ids.xidian.edu.cn/authserver/login;jsessionid=RCW8fwg0RA1f5vG9qYJb8zgeRFjiO3o5ikf9jj3c8vsy4vAEybH2!1292145099?service=http%3A%2F%2Fjwxt.xidian.edu.cn%2Fcaslogin.jsp"
      self.log_url = "http://jwxt.xidian.edu.cn/caslogin.jsp"
    else:
      self.auth_url = auth_url
      self.log_url = log_url
    self.session = requests.Session()

    # 模拟登录
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


# 培养计划
  def Store(self):
    grade_page = self.session.get(
        "http://jwxt.xidian.edu.cn/xkAction.do?actionType=6")

    bsObj = BeautifulSoup(grade_page.text, "html.parser")
    table = bsObj.findAll("table", {"class": "displayTag"})[1]
    rows = table.findAll("tr")

    csvFile = open('./benkeshengkebiao.csv', 'w', newline='', encoding='utf-8')
    writer = csv.writer(csvFile)
    writer.writerow(('培养方案', '课程号', '课程名', '课序号', '学分', '总学时',
                     '课程属性', '考试类型', '教师', '大纲日历', '修读方式', '选课状态'))
    try:
      for row in rows:
        csvRow = []
        for cell in row.findAll("td", {"rowspan": "2"}):
          csvRow.append(cell.get_text().strip())
        for cell in row.findAll("td", {"rowspan": "1"}):
          csvRow.append(cell.get_text().strip())
        writer.writerow(csvRow)
    finally:
      csvFile.close()

  # 将CSV文件存入MySQL
  def saveMysql(self):
    csvFile1 = open('./benkeshengkebiao.csv', 'r', encoding='utf-8')
    reader = csv.DictReader(csvFile1)

    for e in reader:
      # 连接到数据库
      connection = pymysql.connect(host='127.0.0.1', user='root', password='root', db='benkesheng', charset='utf8',
                                   cursorclass=pymysql.cursors.DictCursor)

      # 执行sql语句

      try:
        with connection.cursor() as cursor:
          sql = "insert into `course`(`course_id`,`course_name`,`course_num`,`credit`,`course_attr`,`teacher_name`)values(%s,%s,%s,%s,%s,%s)"
          # 使用 execute()  方法执行 SQL 查询
          cursor.execute(sql, (
              e['课程号'].strip(), e['课程名'].strip(), e['课序号'].strip(), e['学分'].strip(), e['课程属性'].strip(), e['教师'].strip()))
          connection.commit()
      finally:
        connection.close()


if __name__ == '__main__':

  XD = XDspiderKeBiao()
  # 输入学号，密码
  XD.login(id='14050120014', password='081155')
  XD.Store()
  XD.saveMysql()
