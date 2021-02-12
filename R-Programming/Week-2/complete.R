complete <- function(directory, id = 1:332) {  
    path <- paste0(getwd(),"/", directory);
    data <- data.frame();

    for (i in id) {
        raw <- read.csv(
            paste(path, "/", sprintf("%03d", i), ".csv", sep=""),
            as.is = T,
            header = T
        );

        nobs <- sum(complete.cases(raw))
        data <- rbind(data, data.frame(i, nobs))
    }
    
    data;
}