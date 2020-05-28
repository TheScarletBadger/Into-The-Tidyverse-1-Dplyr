rm(list=ls())
library(tidyverse)
library(knitr)

df = read.csv('c:\\users\\barry\\desktop\\R code\\workshop demos\\rocky.csv', na.strings=c("","NA"))
kable(df)
str(df)

#--------------------------------------------The Reorder Function

#arrange ascending
kable(df)
df %>% arrange(by = Height) %>% kable()

#arrange descending
df %>% arrange(by = -Height) %>% kable()


#--------------------------------------------The Mutate Function

#Mutate in place
kable(df)
df %>% mutate(Height = Height*100) %>% kable()

#addition mutation
df %>% mutate(is.male = Gender == 'M') %>% kable()

#addition mutation (not derived from other variables)
df %>% mutate(useless = 1) %>% kable()


#--------------------------------------------The Select Function

#Select for
kable(df)
df %>% select(First.name,Height) %>% kable()

#Select against
df %>% select(-First.name,-Height) %>% kable()


#--------------------------------------------The Filter Function

#Filter for
kable(df)
df %>% filter(Gender == 'M') %>% kable()

#Filter against
df %>% filter(Gender != 'M' & Gender !='F')  %>% kable()

#Filter by operation
df %>% filter(Height > 1.7)  %>% kable()

#Filter out incomplete rows
df %>% filter(!is.na(Last.name))  %>% kable()


#--------------------------------------------The Rename Function

#Change name of variable
kable(df)
df %>% rename(Job = Occupation) %>% kable()


#--------------------------------------------The summarize Function
kable(df)
df %>% summarise(Mu = mean(Height), Max = max(Height), Min = min(Height), SD = sd(Height)) %>% kable()


#--------------------------------------------The Group_by Function

#Group_by alone doesnt make obvious changes, it changes 'analysis context'
kable(df)
df %>% group_by(Gender) %>% kable()

#Group_by one variable piped to summarise
df %>% group_by(Gender) %>% summarise(Mu = mean(Height), Max = max(Height), Min = min(Height), SD = sd(Height)) %>% kable()

#Group_by two variables piped to summarise - note grouping variable declared on the fly
df %>% group_by(Gender,Height>1.65) %>% summarise(Mu = mean(Height), Max = max(Height), Min = min(Height), SD = sd(Height)) %>% kable()


#--------------------------------------------All together now

df2 = df %>% filter(!is.na(Last.name)) %>%
             mutate(Name = paste(First.name, Last.name)) %>%
             mutate(Gender = ifelse(Gender=='F','F','M')) %>%
             mutate(Height = Height*100) %>%
             rename(Height_cm = Height) %>%
             select(Name,Gender,Height_cm)






