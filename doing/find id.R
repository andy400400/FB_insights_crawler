library("XML")
library("httr")
library("stringr")
library("dplyr")
library("jsonlite")

access_token_change<-'CAACEdEose0cBAIZB3yVtTKCqxllR7ruGHOxb6RKHWAJfBn1o1mhqZCZAEhUlu53X5KGdZAFo0Ip4xNUE6F59ImFcpgdf3HxBSPUt9rr3cO9h6ZC0g9CkokwdeNzzBNHMsxs8zqbS1ZB7MkKD8waE4QKpXN3OXDIZBOb2Otb3Cg2BqfB9DaSHLS9KQOpp0iVOzzrkk0UA9npYQZDZD'

url <-paste('https://graph.facebook.com/v2.0/search?type=place&center=24.67,121.77&distance=1000','&access_token=',access_token_change,sep = "")

html_index <- content(GET(url),as = 'parsed')

html_id<-NULL
html_name<-NULL
html_latitude<-NULL
html_longitude<-NULL

for (x in 1:305) {
  html_id<-c(html_id,html_index$data[[x]]$id)
  html_name<-c(html_name,html_index$data[[x]]$name)
  html_latitude<-c(html_latitude,html_index$data[[x]]$location$latitude)
  html_longitude<-c(html_longitude,html_index$data[[x]]$location$longitude)
}


html_all<-cbind(html_id,html_name,html_latitude,html_longitude)


View(html_all)

all_path<-paste("D:/111/","loan",".csv",sep = "")
write.csv(html_all, file = all_path)

#¼W¥[®e§Ô­È
options(digits = 20)

in_data<-read.csv(all_path)

View(in_data_fr)
