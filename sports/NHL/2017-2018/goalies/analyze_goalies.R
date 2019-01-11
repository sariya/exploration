#!/bin/Rscript

#Sanjeev Sariya
#01/10/2019

library(readxl)
library(dplyr)

file.goalies<-"/home/ss5505/data_exploration/sports/NHL/2017-2018/goalies/NHLGoalies2017-18.xls"
workbooks<-excel_sheets(path = file.goalies)

goaliesdf<-read_excel(file.goalies, sheet = "Goalies")

print(dim(goaliesdf))
##95 133

print(length(unique(goaliesdf$"Team(s)"))) #get count of teams

##--get count of people from different countries
as.data.frame(count(goaliesdf,Cntry))

##--see if any golie has done any its own goal

unique(sort(goaliesdf$G))

##--saves by any goalie

goaliesdf$SV

##--get save percentage
goaliesdf$"SV%"

##--get people who shoot

as.data.frame(count(goaliesdf,Sh))

