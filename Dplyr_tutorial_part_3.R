rm(list=ls())
library(tidyverse)
library(knitr)

#Remember to change path to where you have stored rocky.csv and rocky2.csv
df1 = read.csv('C:/Users/Barry/Desktop/Into-The-Tidyverse-1-Dplyr-master/rocky.csv', na.strings=c("","NA"))
df2 = read.csv('C:/Users/Barry/Desktop/Into-The-Tidyverse-1-Dplyr-master/rocky2.csv', na.strings=c("","NA"))

#Put everything we've used so far to process raw data, join tables and compute BMI
df3 = df1 %>% filter(!is.na(Last.name)) %>%
              mutate(FullName = paste(First.name, Last.name)) %>%
              mutate(Gender = ifelse(Gender=='F','F','M')) %>%
              mutate(Height = Height*100) %>%
              rename(Height_cm = Height) %>%
              select(FullName,Gender,Height_cm) %>%
              inner_join(df2,by='FullName') %>%
              mutate(BMI=Weight_KG/((Height_cm/100)^2))
kable(df3)


#just for fun lets use another tidyverse package - ggplot2

df3 %>% ggplot() + aes(x=reorder(FullName,BMI),y=BMI,fill=Gender) + geom_bar(stat='identity')