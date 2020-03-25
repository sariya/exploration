#!/bin/Rscript
#
#Date 01/09/2019
#Sanjeev Sariya

# data: https://www.kaggle.com/cclayford/cricinfo-statsguru-data
#version 8

library(dplyr)
file.read<-"/home/ss5505/data_exploration/sports/cricket/TestMatchesPartnerships.csv"
df.testmatch<-read.table(file.read,header=TRUE,sep=",")
print(dim(df.testmatch))

print(min(df.testmatch$Partnership.Career.Start))
print(max(df.testmatch$Partnership.Career.Start))

print(min(df.testmatch$Partnership.Career.End))
print(max(df.testmatch$Partnership.Career.End))

#
#--Work with 2008 start partnership
#
df.testmatch<-df.testmatch[which(df.testmatch$Partnership.Career.Start==2009),]
length(unique(df.testmatch$Country ))


#get count per country
library(plyr)
count(df.testmatch,Country)

#--count number of total partners from country 
as.data.frame(count(df.testmatch,Country)) %>% arrange(desc(n))


#https://stackoverflow.com/a/1661144/2740831

#--get number of partnerships per country

as.data.frame(aggregate(df.testmatch$Number.Of.Partnerships ~ df.testmatch$Country , data=df.testmatch ,sum))  %>% 
rename(Country="df.testmatch$Country",TotalPartnerships="df.testmatch$Number.Of.Partnerships" ) %>%
arrange(desc(TotalPartnerships))
