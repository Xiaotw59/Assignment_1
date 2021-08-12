dataset_url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(dataset_url, "specdata.zip")
unzip("specdata.zip", exdir = "specdata")
list.files("specdata")
file001<-read.csv("specdata/001.csv")
head(file001)
length(file001$Date)
dim(file001)
str(file001)
summary(file001)
names(file001)
files<-list.files("specdata")
files[1]
head(read.csv(files[3]))
files_full <- list.files("specdata", full.names=TRUE)
head(read.csv(files_full[3]))
#Part 1
pollutantmean<-function(directory,pollutant,id){
        files_list <- list.files(directory, full.names=TRUE)
        dat<-data.frame()
        for (i in id){
                dat<-rbind(dat, read.csv(files_list[i]))
        }
        mean(dat[,pollutant],na.rm=TRUE)
}
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)