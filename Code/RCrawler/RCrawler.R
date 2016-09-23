install.packages("RCurl") #if you haven't install this package, run this line
library(RCurl)

url.exists(url="www.baidu.com") 
# [1] TRUE
d = debugGatherer() #收集调试信息
# verbose = TRUE 这时候，d$value()值是会叠加的
#tmp = getURL(url="www.baidu.com", debugfunction = d$update, verbose = TRUE, .encoding = "UTF-8");  
tmp = getURL(url="10.13.6.7", debugfunction = d$update, verbose = TRUE)  
names(d$value())
# [1] "text"       "headerIn"   "headerOut"  "dataIn"     "dataOut"    "sslDataIn"  "sslDataOut"

cat(d$value()[1]) #服务器地址及端口号
cat(d$value()[2]) #服务器返回的头信息
cat(d$value()[3]) #提交给服务器的头信息
#d$reset() # 清除d$value()
#d$value() # 清除之后全部为空

#响应的报头
h = basicHeaderGatherer()
txt = getURL(url="http://www.baidu.com", headerfunction = h$update)
names(h$value())
h$value()[1:17]
h$value()[2]


namecard =
  '<namecard>
<name>zhangsan</name>
<age zhousui="true">18</age>
<phone os="ios">
<first>iphone3</first>
<second>iphone5</second>
<third>iphone7</third>
</phone>
</namecard>'
xmlcard = xmlParse(namecard)
xmltop = xmlRoot(xmlcard)
class(xmltop)
xmlName(xmltop)
xmlSize(xmltop)
xmlName(xmltop[[1]])
xmlAttrs(getNodeSet(xmlcard,'/namecard//age[@zhousui]')[[1]],"zhousui") 



library(RCurl)
library(XML)
start_url = "http://bj.meituan.com/category/meishi"

#读取PageSouce
pagesource = getURL(start_url,.encoding="utf-8")

xmldoc = htmlParse(pagesource);
#sapply(getNodeSet(xmldoc,'//div[@class="goods"]//a[@class="goods-name"]//text()'),xmlValue)
sapply(getNodeSet(xmldoc,'//div[contains(@data-mtd-showlog,@data-mtd-clicklog)]//a[@class="link f3 J-mtad-link"]//text()'),xmlValue);
sapply(getNodeSet(xmldoc,'//div[contains(@data-mtd-showlog,@data-mtd-clicklog)]//div[@class="tag-list"]/a[last()]/text()'),xmlValue);

sapply(getNodeSet(xmldoc,'//ul[@class="paginator paginator--notri paginator--large"]//li[@data-page]/a/text()'),xmlValue);



