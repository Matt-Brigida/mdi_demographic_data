library(tidyverse)

MDIdata <- read_csv("./headquarter_dem_info_jim.csv")

MDIdata <- MDIdata %>% mutate(State_Name = state.name[match(MDIdata$State,state.abb)])

## now need to convert into one row for each state and add a count variable, and average all other columns

mdiStates <- data.frame(table(MDIdata$State_Name))
names(mdiStates) <- c("State", "Count")
mdiStates$State <-  tolower(mdiStates$State)

### US map viz-----

us <- map_data("state")

pdf("us_map_count_all_mdis.pdf")
gg <- ggplot()
gg <- gg + geom_map(data=us, map=us,
                    aes(x=long, y=lat, map_id=region),
                    fill="#ffffff", color="#ffffff", size=0.15)
gg <- gg + geom_map(data=mdiStates, map=us,
                    aes(fill=Count, map_id=State),
                    color="#ffffff", size=0.15)
## gg <- gg + scale_fill_continuous(low='thistle2', high='darkred', 
                                 ## guide='colorbar')
gg <- gg + scale_fill_continuous(low='lightblue', high='royalblue4', 
                                 guide='colorbar')
gg <- gg + labs(x=NULL, y=NULL)
gg <- gg + coord_map("albers", lat0 = 39, lat1 = 45) 
gg <- gg + theme(panel.border = element_blank())
gg <- gg + theme(panel.background = element_blank())
gg <- gg + theme(axis.ticks = element_blank())
gg <- gg + theme(axis.text = element_blank())
gg
dev.off()



### view correlation between african american MDIs and percent African American

MDIdata$`African  American` <- as.numeric(MDIdata$`African  American`)
MDIdata$`Hispanic` <- as.numeric(MDIdata$`Hispanic`)
MDIdata$`Asian` <- as.numeric(MDIdata$`Asian`)

percentGroup <- MDIdata %>% group_by(`MDI Type`) %>% summarize(Mean_Percent_African_American = mean(`African  American`, na.rm = TRUE), Mean_Percent_Hispanic = mean(`Hispanic`, na.rm = TRUE), Mean_Percent_Asian = mean(`Asian`, na.rm = TRUE))




totalAssets <- MDIdata %>% group_by(State) %>% summarize(Median = median(`Total Assets ($'000)`), Mean = mean(`Total Assets ($'000)`), Sum = sum(`Total Assets ($'000)`))

MDIdata$"Total Assets ($'000)"    
