#爬取西电新闻网部分信息
import requests
from bs4 import BeautifulSoup
import csv
import codecs

#以CSV的格式保存
csvfile = open('xidian9.csv','w',newline='',encoding="utf-8")
writer = csv.writer(csvfile)

def store(number,title,content):
    csvrow = []
    csvrow.append(number)
    csvrow.append(title)
    csvrow.append(content)
    writer.writerow(csvrow)


res = requests.get('http://news.xidian.edu.cn/')
res.encoding='utf-8'
soup = BeautifulSoup(res.text,'html.parser')
wholenews = soup.select('.content1_left_bottom_right')#wholenews是一个列表，不能直接select
newsoup = BeautifulSoup(str(wholenews),'html.parser')#试试将wholenews列表转化为newsoup,可以select的一个模式
newlist = newsoup.select('li')#newlist是一个列表，以Li为单位的
number = 0

#获取每一个标题
for news in newlist:  #news 是list重的每一项，可以用select
    number = number+1
    a = news.select('a')
    a2 = a[1].text
    link = a[1]['href']
    if (len(link) <=21):
        turelink = 'http://news.xidian.edu.cn/' + link
    else:
        turelink = link
    a3 = a2.encode('GBK','ignore').decode("GBK")
    print(str(number) + '.标题： '+a3)

    #获取每一个标题之后，再获取每一个标题下的内容
    reslist = requests.get(turelink)
    reslist.encoding='utf-8'
    souplist = BeautifulSoup(reslist.text,'html.parser')

    alltext = souplist.select('#wz_zw') #一个列表
    neirongsoup = BeautifulSoup(str(alltext), 'html.parser')
    neironglist = neirongsoup.select('p')
    lenp = len(neironglist)

    print("内容：")
    wn = ''
    for i in range(lenp):
        n = neironglist[i].text
        wn = str(wn) +str(n)
    print(wn)
    wn1 = wn.encode('GBK', 'ignore').decode('GBK')

    store(number,a3,wn1)

































