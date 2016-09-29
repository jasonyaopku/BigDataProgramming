#install.packages("RCurl") #if you haven't install this package, run this line
library(XML)
library(RCurl)



namecard =
  '<div>
<name>zhangsan</name>
<age zhousui="true">18</age>
<Allphone>
<phone color="red"  os="ios">iphone3</phone>
<phone color="red"  os="android">xiaomi1</phone>
<phone color="gray" os="ios">iphone5</phone>
<phone color="gray" os="android" href="http://www.xiaomi.com/xiaomi1/">xiaomi2</phone>
<phone color="silver" os="ios" href="http://www.apple.com/iphone-7/">iphone7</phone>
<phone color="silver" os="android">xiaomi3</phone>
</Allphone>
</div>';
xmlcard = xmlParse(namecard)
xmltop = xmlRoot(xmlcard)
class(xmltop)
xmlName(xmltop)
xmlSize(xmltop)
xmlName(xmltop[[1]])
xmlAttrs(getNodeSet(xmlcard,'//*[@href]')[[1]],"href");
sapply(getNodeSet(xmlcard,'//*[@href]') , xmlAttrs);

#get all the phones
getNodeSet(xmlcard,"//phone//text()")


#get all the xiaomi
getNodeSet(xmlcard,'//phone[@os="android"]/text()')
getNodeSet(xmlcard,'/div/Allphone/phone[@os="ios" and @color="red"]/text()')



getDatafromOnepage = function(pageurl)
{
  url.exists(pageurl)
  pagesource = getURL(pageurl,.encoding="utf-8");
  xmldoc = htmlParse(pagesource);
  storenames = sapply(getNodeSet(xmldoc,'//div[@data-mtd-showlog and @data-mtd-clicklog]//div[@class="basic cf"]//a/text()'),xmlValue);
  storenames
  places =  sapply(getNodeSet(xmldoc,'//div[@data-mtd-showlog and @data-mtd-clicklog]//div[@class="tag-list"]/a[last()]/text()'),xmlValue);
  places
  
  
  rates = sapply(getNodeSet(xmldoc,'//div[@data-mtd-showlog and @data-mtd-clicklog]//div[@class="rate"]//span[@class="rate-stars"]'),xmlGetAttr,"style");
  
  strlens = nchar(rates);
  splitrates = substr(rates,7,strlens-1);
  finalrates = as.numeric(splitrates);
  
  onepagedata = data.frame(name = storenames,place = places,rate = finalrates);
  return(onepagedata)
}


start_url = "http://bj.meituan.com/category/meishi";
AllData = NULL;
#http://bj.meituan.com/category/meishi/all/page2
for(i in 1:7)
{
  if(i==1)
  {
    url=start_url;
  }else
  {
    
    url = paste0(start_url,"/all/page",i);
  }
  
  message("Craw data from webpage:   ",url);
  onepagedata = getDatafromOnepage(url);
  AllData = rbind(AllData,onepagedata);
}

write.csv(AllData,file = "Meituanmeishi.csv",row.names = FALSE)








