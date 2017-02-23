from urllib.request import urlopen
from bs4 import BeautifulSoup
import re
import pymysql.cursors
#请求URL并把结果用utf-8编码
resp = urlopen("https://en.wikipedia.org/wiki/Main_Page").read().decode("utf_8")
#使用BeautifulSoup去解析网页
soup = BeautifulSoup(resp, "html.parser")
#获取所有已/wiki开头的a标签的href属性
listUrl = soup.find_all("a", href=re.compile("^/wiki/"))
#输出所有的词条对应的名称和URL
for url in listUrl:
    if not re.search("\.(jpg|JPG)$", url["href"]):
        print(url.get_text(), "----", "https://en.wikipedia.org" + url["href"])
#获取数据库连接
        connection = pymysql.connect(host='localhost', user='root', password='root', db='wikiurl', charset='utf8mb4',cursorclass = pymysql.cursors.DictCursor)


        try:
              with connection.cursor() as cursor:
        # 创建sql语句
                    sql = "insert into `urls`(`urlname`,`urlhref`)values(%s,%s)"

        #执行sql语句
                    cursor.execute(sql,(url.get_text(),"https://en.wikipedia.org" + url["href"]))

        #提交
                    connection.commit()
        finally:
                connection.close()




