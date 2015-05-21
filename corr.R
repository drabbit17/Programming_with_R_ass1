corr <- function(directory, threshold=0){
        wd <- "/Users/newaesthetic/data/R/coursera/programming_with_R/ass1"
        setwd(wd)
        source("complete.R")
        dfrm <- complete(directory)
        setwd(paste(wd, directory, sep = "/"))
        valid <- numeric(length(dfrm[[1]]))
        valid <- ifelse (dfrm$nobs>threshold, valid <- 1, valid <- 0) 
        dfrm <- cbind(dfrm, valid)
        use <- subset(dfrm, select = id, subset = (dfrm$valid > 0))
        use <- as.numeric(use[[1]])
        corvect <- numeric(length(use))
        for (i in use){
                ni <- sprintf("%03d", as.numeric(i))
                temp <- read.csv(paste(ni,".csv", sep = ""))
                l <- match(i, use)
                corvect[l] <- cor(temp$sulfate, temp$nitrate, use = "na.or.complete")
        }
        setwd("/Users/newaesthetic/data/R/coursera/programming_with_R/ass1")
        return(corvect)       
}
