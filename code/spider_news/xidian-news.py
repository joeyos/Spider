import requests
import pymysql
from bs4 import BeautifulSoup
# 获取主网页全部代码
news_res = requests.get("http://news.xidian.edu.cn/")
news_res.encoding = 'utf-8'
# 对全部网页代码进行soup化，并提取有用内容，内容格式为list,但其实内容只有一个class
news_hosepage_html_soup = BeautifulSoup(news_res.text, 'html.parser')
selected_news_html = news_hosepage_html_soup.select(
    '.content1_left_bottom_right')
# 将content1_left_bottom_right内容soup化
new_list_soup = BeautifulSoup(str(selected_news_html), 'html.parser')
# 提取每一条新闻
new_list = new_list_soup.select('li')
# 获取会议网页
huiyi_res = requests.get("http://www.xidian.edu.cn/hyap.htm")
huiyi_res.encoding = 'utf-8'
huiyi_hostpage_html_soup = BeautifulSoup(huiyi_res.text, 'html.parser')


# 获取单个新闻的时间函数
def getnew_date(clink):
    every_new_html_res = requests.get(clink)
    every_new_html_res.encoding = 'utf-8'
    every_new_html_soup = BeautifulSoup(every_new_html_res.text, 'html.parser')
    date1 = every_new_html_soup.select('#date')[0].text
    date2 = date1[5:15]
    date = date2.replace('-', '.')
    return date

# 获取单个新闻图片函数


def getnew_pict(clink):
    every_new_html_res = requests.get(clink)
    every_new_html_res.encoding = 'utf-8'
    every_new_html_soup = BeautifulSoup(every_new_html_res.text, 'html.parser')
    selected_text_list = every_new_html_soup.select('#wz_zw')
    picsoup = BeautifulSoup(str(selected_text_list), 'html.parser')
    piclist = picsoup.select('img')
    lenpic = len(piclist)
    srcfirst = 'http://news.xidian.edu.cn/'
    picsrc = []
    for i in range(lenpic):
        srclast1 = piclist[i]['src'][7:]
        srclast2 = '_' + srclast1
        src = str(srcfirst) + str(srclast2)
        picsrc.append(src)
    return picsrc

# 获取单个新闻内容的函数


def getnew_content(clink):
    every_new_html_res = requests.get(clink)
    every_new_html_res.encoding = 'utf-8'
    every_new_html_soup = BeautifulSoup(every_new_html_res.text, 'html.parser')
    selected_text_list = every_new_html_soup.select('#wz_zw')  # 一个列表
    neirongsoup = BeautifulSoup(str(selected_text_list), 'html.parser')
    neironglist = neirongsoup.select('p')
    lenp = len(neironglist)
    content = ''
    for i in range(lenp):
        n = neironglist[i].text
        content = str(content) + str(n)
    return content

# 获取单个会议的内容


def get_huiyi_content(clink):
    every_huiyi_html_res = requests.get(clink)
    every_huiyi_html_res.encoding = 'utf-8'
    every_huiyi_html_soup = BeautifulSoup(
        every_huiyi_html_res.text, 'html.parser')

    selected_text_list = every_huiyi_html_soup.select('.Section1')
    neirong_soup = BeautifulSoup(str(selected_text_list), 'html.parser')
    neirong_list = neirong_soup.select('p')
    lenp = len(neirong_list)
    wn = ''
    for i in range(lenp):
        n = neirong_list[i].text
        wn = str(wn) + str(n)
    return wn

# 针对每一个会议id获取 name、content、publisher、date、is_hot、category_id


def everyhuiyi(i):
    huiyi_id = '#lineu41_' + str(i)
    selected_every_huiyi_html = huiyi_hostpage_html_soup.select(huiyi_id)
    every_huiyi_soup = BeautifulSoup(
        str(selected_every_huiyi_html), 'html.parser')
    href = every_huiyi_soup.select('a')[0]['href']
    date0 = every_huiyi_soup.select('.sj-ri')[0].text
    date1 = every_huiyi_soup.select('.sj-nian')[0].text

    id = i
    publisher = "会议活动"
    is_hot = 0
    category_id = 2
    name = every_huiyi_soup.select('a')[0].text
    link = 'http://www.xidian.edu.cn/' + href
    date = date1 + '.' + date0
    content = get_huiyi_content(link)

# 针对每一条新闻id开始获取name、content、publisher、date、is_hot、category_id,picsrc


def everynew(i):
    onenew_soup = BeautifulSoup(str(new_list[i]), 'html.parser')
    href = onenew_soup.select('a')[1]['href']

    id = i
    publisher = "新闻网"
    id_hot = 0
    category_id = 1
    name = onenew_soup.select('a')[1].text
    link = 'http://news.xidian.edu.cn/' + href
    date = getnew_date(link)
    content = getnew_content(link)
    picsrc = getnew_pict(link)

    # 连接数据库
    connection = pymysql.connect(host='127.0.0.1', user='root', password='root', db='test3', charset='utf8',
                                 cursorclass=pymysql.cursors.DictCursor)
    # 执行sql语句
    try:
        with connection.cursor() as cursor:
            sql = "insert into `news`(`name`,`content`,`publisher`,`date`)values(%s,%s,%s,%s)"
            # 使用 execute()  方法执行 SQL 查询
            cursor.execute(sql, (name, content, publisher, date))
            connection.commit()
    finally:
        connection.close()

    # print(id)
    # print(name)
    # print(link)
    # print(date)
    # print(content)
    # print(picsrc)

for i in range(len(new_list)):
    everynew(i)

for i in range(10):
    everyhuiyi(i)
