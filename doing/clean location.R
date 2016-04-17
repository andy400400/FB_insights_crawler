yourfolder<-'chiao'
yourname<-'chiao_clean'

all<-dir(paste("C:/Users/Student/Desktop/pro/data/",yourfolder,sep = ""))

options(digits = 20)

add_path<-paste("C:/Users/Student/Desktop/pro/data/originallocation/",yourfolder,".csv",sep = "")
add_data<-read.csv(add_path,stringsAsFactors = FALSE)

clean_id<-NULL
clean_name<-NULL
clean_latitude<-NULL
clean_longitude<-NULL

#file
for (z in 1:length(all)) {
  file_id<-unlist(strsplit(all[z],".csv"))
  #dir
  for (c in 1:nrow(add_data)) {
    if (add_data$html_id[c] == file_id) {
      clean_id<-c(clean_id,add_data$html_id[c])
      clean_name<-c(clean_name,add_data$html_name[c])
      clean_latitude<-c(clean_latitude,add_data$html_latitude[c])
      clean_longitude<-c(clean_longitude,add_data$html_longitude[c])
    }
  }
}

data_clean<-cbind(clean_id,clean_name,clean_latitude,clean_longitude)

add_path<-paste("C:/Users/Student/Desktop/pro/data/cleanlocation/",yourname,".csv",sep = "")
write.csv(data_clean, file = add_path)


