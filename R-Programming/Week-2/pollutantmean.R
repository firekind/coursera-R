pollutantmean <- function(directory, pollutant, id = 1:332) {  
    path <- paste0(getwd(),"/", directory);
    data <- data.frame();

    for (i in id) {
        dat <- read.csv(
            paste(path, "/", sprintf("%03d", i), ".csv", sep=""),
            as.is = T,
            header = T
        );

        data <- rbind(data, dat);
    }
    mean(data[,pollutant], na.rm = T);
}