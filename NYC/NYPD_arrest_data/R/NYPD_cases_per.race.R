#!/usr/bin/env Rscript

##
##March 31 2020
##Sanjeev Sariya

library(Cairo)
library(ggplot2)
library(dplyr)

df_nypd<-read.csv("../data/NYPD_Arrest_Data__Year_to_Date_.csv",header=TRUE)
dim(df_nypd)
print(colnames(df_nypd))

summary(df_nypd) ##do sanity checks

as.data.frame(summary(df_nypd$PERP_RACE)) ## check counts

colSums(as.data.frame(summary(df_nypd$PERP_RACE))) ##check these match

as.data.frame(summary(df_nypd$PERP_RACE)) ##check

##get a pretty df
counts_perRace<-as.data.frame(summary(df_nypd$PERP_RACE)) %>% `colnames<-` (c("Count")) %>% mutate(Race=row.names(.))

counts_perRace[1,2]<-"AMERICAN INDIAN\nALASKAN NATIVE"
counts_perRace[2,2]<- "ASIAN\nPACIFIC ISLANDER"

CairoPNG(filename = "counts_perRace.png",quality = 75, height=800, width=900)

ggplot(data=counts_perRace, aes(x=Race,y=Count,  fill=Race)) + 
  geom_bar(stat="identity",show.legend = FALSE,colour="black")+
  labs(title="Number of perpetrators per Race", x ="Race", y = "Counts") +
  theme_bw() +
  theme(
    plot.title = element_text( size=15, face="bold", hjust = 0.5),
    axis.title.x = element_text(size=13, face="bold"),
    axis.title.y = element_text(size=13, face="bold"),
    axis.text.y = element_text(size=11, face="bold"),
    axis.text.x = element_text(size=11, face="bold"),
    axis.line = element_line(size=1.2 )
  ) 

dev.off()


