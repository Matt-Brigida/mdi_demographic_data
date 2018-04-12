library(tidyverse)

MDIdata <- read_csv("./headquarter_dem_info_jim.csv")

MDIdata %>% mutate(State_Name = state.name[match(MDIdata$State,state.abb)])

## now need to convert into one row for each state and add a count variable, and average all other columns



### US map viz-----

us <- map_data("state")

