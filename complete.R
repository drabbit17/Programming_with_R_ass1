complete <- function(directory, id = 1:332 ){
        wd <- "/Users/newaesthetic/data/R/coursera/programming_with_R/ass1"
        setwd(paste(wd, directory, sep = "/"))
        n <- length(id)
        dfrm <- data.frame(id=character(n), nobs = numeric(n))
        for (i in id) {
                ni <- sprintf("%03d", i)
                temp <- read.csv(paste(ni,".csv", sep = ""))
                l <- match(i, id)
                dfrm$id[l] <- i
                counts <- is.na(temp$sulfate)
                countn <- is.na(temp$nitrate)
                dfrm$nobs[l] <- sum(as.numeric(!counts)*as.numeric(!countn))
        }
        setwd("/Users/newaesthetic/data/R/coursera/programming_with_R/ass1")
        return(dfrm)
}
