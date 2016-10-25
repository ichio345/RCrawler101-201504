rm(list=ls(all.names = TRUE));


library(httr)
library(rjson)
library(httpuv)
library(Rfacebook)
prefex = "https://graph.Facebook.com/v2.8/"
token ="EAACEdEose0cBAJbFrZCh430ZBAMb7seLKhJZAybFHDxsfZCsGldNgCISZAnK0RVZCVMFmRyTO2TqU3nXB6g8AE6xmbeIG2bkTIK0pl7p9VjHrQ33QqpoZC11empO9OZAVsioSjjsHef2qLfUW4GoGalYhoeOnh3CZCCOwBghC6CddvQZDZD"
#----------------------------------
number = 2
attrs  = paste0("me/friends?limit=",
                number,"&access_token=")
url    = paste0(prefex, attrs, token)
res= GET(url)
data   = content(res)

friends = matrix(unlist(data$data))

after = data$paging$cursors$after

while( after !="")
{
nextUrl = paste0(url,"&after=", after)
nextres = GET(nextUrl)
ndata = content(nextres)
nfriends = matrix(unlist(ndata$data))
after = ndata$paging$cursors$after
}

aftern = ndata$paging$cursors$after
url3= paste0(nextUrl, "&after=",aftern )
res3 = GET(nnurl)
data3 = content(res3)
nfriends3 = matrix(unlist(data3$data))
