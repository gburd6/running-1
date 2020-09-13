#Running Data from Summer 2019 and 2020
#Updated initial csv to contain rates and times as pure decimals
#-----------------------------------------------------------------

run <-read.csv("Running.csv", header = TRUE, stringsAsFactors = FALSE)  #the data
head(run)

library(tidyverse)
library(ggrepel)
library(viridis)
dates <- run$Date
dates
duration <- run$Decimal_Run_Time
duration
distance <- run$Total_Distance_Mi
distance
pace_per_mi<- run$Decimal_Avg_Min_Per_Mi
pace_per_mi


pace_over_time<- run %>% ggplot(aes(dates, pace_per_mi, label = Total_Distance_Mi, color = Total_Distance_Mi))+scale_y_reverse()+
  theme(plot.title=element_text(hjust = 0.5))+
  ggtitle("Running:Pace Per Mile over Time")+
  geom_point()+scale_color_gradient(low="blue", high = "orange")+
  geom_label()+theme(axis.text.x = element_text(angle= 90))+
  geom_text()+
  geom_hline(yintercept = mean(pace_per_mi),linetype= "dashed", color= "blue", size = 2, alpha = 0.25)
#plot of average pace per mile over time
pace_over_time

distance_vs_pace <- run%>%ggplot(aes( pace_per_mi))+geom_histogram(binwidth = 0.125, color = "black",  fill = "green")+scale_x_reverse()+coord_flip()

distance_vs_pace
