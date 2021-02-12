corr <- function(directory, threshold = 0) {
    path <- paste0(getwd(),"/", directory);
    corr_vect <- NULL;

    for (i in 1:332) {
        raw <- read.csv(
            paste(path, "/", sprintf("%03d", i), ".csv", sep=""),
            as.is = T,
            header = T
        );
    
        data <- raw[complete.cases(raw),];

        if (nrow(data) > threshold) {
            corr_vect <- c(corr_vect, cor(data[,"sulfate"], data[, "nitrate"]))
        }
    }
    
    return(corr_vect);
}