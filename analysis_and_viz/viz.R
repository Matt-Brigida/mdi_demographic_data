
## try working in the tidy framework------
library(tidyverse)

## library(ggplot2)

demData <- read_csv(url("https://github.com/matt-brigida/mdi_demographic_data/raw/master/ids_and_tracts.csv"))#, stringsAsFactors = FALSE)
## demData <- demData[complete.cases(demData), ]

demData$X2017.Estimated.Tract.Median.Family.Income <- as.numeric(gsub("\\$", "", demData$X2017.Estimated.Tract.Median.Family.Income))

names(demData)[17] <- "tract_minority_percent"
names(demData)[24] <- "percent_below_poverty_line"

### tract minority percent with an income level fill----
ggplot(demData, aes(tract_minority_percent, fill = `Tract Income Level`)) +
    geom_histogram() +
        labs(
    title = "Minority Percent Histogram",
    subtitle = "The colors represent the income levels of the tracts comprising each histogram bar.",
    caption = "Data from FDIC",
    x = "Tract Minority Percent"
    )

### similar to above but using freqpoly, doesnt look good.
ggplot(demData, aes(tract_minority_percent, colour = `Tract Income Level`)) +
  geom_freqpoly()




ggplot(demData, aes(percent_below_poverty_line, fill = `Underserved or Distressed Tract`)) +
    geom_histogram()

ggplot(demData, aes(`Number of Households`)) +
    geom_histogram()


ggplot(demData, aes(y = tract_minority_percent, x = percent_below_poverty_line)) +
    geom_point(aes(color = `Underserved or Distressed Tract`)) +
    geom_smooth(se = TRUE) +
    labs(
    title = "Test Plots",
    subtitle = "Just looking at data",
    caption = "Data from FDIC",
    x = "Percent Below Poverty Line",
    y = "Tract Minority Percent"
  )

