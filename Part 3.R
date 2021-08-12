#Part 3
corr<-function(directory,threshold=0){
        files_list <- list.files(directory, full.names=TRUE)
        dat<-vector(mode="numeric",length=0)
        for (i in 1:length(files_list)){
                file<-read.csv(files_list[i])
                nobs<-sum(complete.cases(file))
                if (nobs>threshold) {
                        tmp1<-file[which(!is.na(file$sulfate)), ]
                        tmp2<-tmp1[which(!is.na(tmp1$nitrate)), ]
                        dat<-c(dat,cor(tmp2$sulfate,tmp2$nitrate))
                }
        }
        dat
}
cr<-corr("specdata", 150)
head(cr)
summary(cr)
cr <- corr("specdata", 400)
head(cr)
summary(cr)
cr <- corr("specdata", 5000)
summary(cr)
length(cr)
cr <- corr("specdata")
summary(cr)
length(cr)