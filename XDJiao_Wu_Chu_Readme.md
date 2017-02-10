# XDJiao_Wu_Chu.py说明文档
1、__init__():两个URL分别为用抓包软件获取的实际登录网址和实际提交账号密码的网址。
2、login():用抓包软件获取的用Chrome浏览器登录教务处的head报文，login（）为模拟登录教务处的所需信息。
3、Print（）：将登录进去的课程表HTML网页打印出来。
4、使用前请确认安装BeautifulSoup模块。请修改里面的学号id和password再进行运行。
5、后续将从HTML网页中提取出有用的信息。
6、运行login（）后便可以登录进教务处系统，修改Print（）中的URL即可完成不同信息的获取，比如换成成绩网页的URL、教务通知的URL等等。