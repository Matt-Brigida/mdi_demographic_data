
## try working in the tidy framework------
library(tidyverse)

## library(ggplot2)

demData <- read_csv(url("https://github.com/matt-brigida/mdi_demographic_data/raw/master/ids_and_tracts.csv"))#, stringsAsFactors = FALSE)
## demData <- demData[complete.cases(demData), ]

demData$X2017.Estimated.Tract.Median.Family.Income <- as.numeric(gsub("\\$", "", demData$X2017.Estimated.Tract.Median.Family.Income))

names(demData)[17] <- "tract_minority_percent"
names(demData)[24] <- "percent_below_poverty_line"

ggplot(demData, aes(tract_minority_percent)) +
    geom_histogram()

ggplot(demData, aes(percent_below_poverty_line)) +
    geom_histogram()

ggplot(demData, aes(y = tract_minority_percent, x = percent_below_poverty_line)) + geom_point()
