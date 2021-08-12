#Part 2
complete<-function(directory,id){
        files_list <- list.files(directory, full.names=TRUE)
        dat<-data.frame()
        for (i in id){
                file<-read.csv(files_list[i])
                nobs<-sum(complete.cases(file))
                tmp<-data.frame('id'=i,'nobs'=nobs)
                dat<-rbind(dat,tmp)
        }
        dat
}
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)
