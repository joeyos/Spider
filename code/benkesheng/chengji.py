# Python35 爬取西电本科生教务处 z综合查询查询 成绩等
# 2017/03/11 V1.0
# coding=utf-8
import requests
import csv
from bs4 import BeautifulSoup


class ScrapeGrade:
  def __init__(self, auth_url=None, log_url=None):
    if not auth_url:
      self.auth_url = "http://ids.xidian.edu.cn/authserver/login;jsessionid=RCW8fwg0RA1f5vG9qYJb8zgeRFjiO3o5ikf9jj3c8vsy4vAEybH2!1292145099?service=http%3A%2F%2Fjwxt.xidian.edu.cn%2Fcaslogin.jsp"
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

  def Print(self):
    grade_page = self.session.get(
        "http://jwxt.xidian.edu.cn/gradeLnAllAction.do?type=ln&oper=qbinfo&lnxndm=2016-2017%D1%A7%C4%EA%B5%DA%D2%BB%D1%A7%C6%DA(%C1%BD%D1%A7%C6%DA) ")
    bsObj2 = BeautifulSoup(grade_page.text, "html.parser")

    nameList = bsObj2.findAll("td")
    for name in nameList:
      print(name.get_text())


if __name__ == '__main__':
  sg = ScrapeGrade()
  # 输入学号，密码
  sg.login(id='14050120014', password='081155')
  sg.Print()
