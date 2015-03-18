pollutantmean <- function(directory, pollutant, id = 1:332 ){
        wd <- "/Users/newaesthetic/data/R/coursera/programming_with_R/ass1"
        setwd(paste(wd, directory, sep="/"))
        n <- length(id)
        vmean <- numeric(n)
        lmean <- numeric(n)
        for (i in id) {
                ni <- sprintf("%03d", i)
                temp <- read.csv(paste(ni,".csv", sep=""))
                l <- match(i, id)
                x <- temp[pollutant]
                reallength <- length(x[[1]])-sum(is.na(x[[1]]))
                vmean[l] <- mean(x[[1]], na.rm = TRUE)*reallength
                lmean[l] <- reallength
        }
        setwd("/Users/newaesthetic/data/R/coursera/programming_with_R/ass1")
        return(sum(vmean)/sum(lmean))
}