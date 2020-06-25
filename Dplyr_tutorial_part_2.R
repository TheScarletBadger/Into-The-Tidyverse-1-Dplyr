rm(list=ls())
library(tidyverse)
library(knitr)

#Remember to change path to where you have stored rocky.csv and rocky2.csv
df1 <- read.csv('C:/Users/Barry/Desktop/Into-The-Tidyverse-1-Dplyr-master/rocky.csv', na.strings=c("","NA"))
df2 <- read.csv('C:/Users/Barry/Desktop/Into-The-Tidyverse-1-Dplyr-master/rocky2.csv', na.strings=c("","NA"))

#Perform same pre-processing steps as in part 1 except group_by and summarise
df1 <- df1 %>% filter(!is.na(Last.name)) %>%
               mutate(FullName = paste(First.name, Last.name)) %>%
               mutate(Gender = ifelse(Gender=='F','F','M')) %>%
               mutate(Height = Height*100) %>%
               rename(Height_cm = Height) %>%
               select(FullName,Gender,Height_cm)

kable(df1)
kable(df2)

#--------------------------------------------Full join

#join df2 onto right side of df1 using FullName as key
full_join(df1,df2,by='FullName') %>% kable()

#join df1 onto right side of df2 using FullName as key
full_join(df2,df1,by='FullName') %>% kable()


#--------------------------------------------Left join

#join df2 onto right side of df1 using FullName as key
left_join(df1,df2,by='FullName') %>% kable()

#join df1 onto right side of df2 using FullName as key
left_join(df2,df1,by='FullName') %>% kable()


#--------------------------------------------inner join

#keep entries which appear in both df1 and df2
inner_join(df1,df2,by='FullName') %>% kable()

#keep entries which appear in both df1 and df2
inner_join(df2,df1,by='FullName') %>% kable()


#--------------------------------------------Anti join

#keep entries which are in df1 but not df2
anti_join(df1,df2,by='FullName') %>% kable

#keep entries which are in df2 but not df1
anti_join(df2,df1,by='FullName') %>% kable()



