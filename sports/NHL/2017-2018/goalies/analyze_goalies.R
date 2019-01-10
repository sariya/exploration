#!/bin/Rscript

#Sanjeev Sariya
#01/10/2019

library(readxl)


file.goalies<-"/home/ss5505/data_exploration/sports/NHL/2017-2018/goalies/NHLGoalies2017-18.xls"
workbooks<-excel_sheets(path = file.goalies)

goaliesdf<-read_excel(file.goalies, sheet = "Goalies")