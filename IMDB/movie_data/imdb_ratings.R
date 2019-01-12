#!/bin/Rscript

##Date 01/11/2019
##Sanjeev Sariya

##Imdb ratings downloaded from facebook

##https://www.kaggle.com/carolzhangdc/imdb-5000-movie-dataset

library(dplyr)
library(plyr)
file.imdb<-"/mnt/mfs/hgrcgrid/homes/ss5505/data_exploration/IMDB/movie_metadata.csv"
df.imdb<-read.csv(file.imdb,header = TRUE)

print(dim(df.imdb)) ##5043 rows and 28 columns
##get counts of title year
count(df.imdb,"title_year")

which(is.na(df.imdb$title_year))

df.imdb_filtered<-df.imdb[-c(which(is.na(df.imdb$title_year))),] ##filter movies no title year

summary(df.imdb_filtered$gross)
summary(df.imdb_filtered$budget)
summary(df.imdb_filtered$imdb_score)

###filter movies based on missing gross and budget information
df.imdb_filtered<- df.imdb_filtered[-c(which(is.na(df.imdb_filtered$gross) | is.na(df.imdb_filtered$budget))),]

print(dim(df.imdb_filtered)) ### 

##filter data based on language
##make language filed as character
df.imdb_filtered$language<-(as.character(df.imdb_filtered$language))

df.imdb_filtered<-df.imdb_filtered[-c(which(df.imdb_filtered$language=="" | df.imdb_filtered$language=="None")),]
print(dim(df.imdb_filtered))

count(df.imdb_filtered,"title_year")
##--let us work with movies from 1997 only

length(which(df.imdb_filtered$title_year>=1997)) ## get count of movies after 1999 onlywe work with last 20 years of data only 

df.imdb_filtered<-df.imdb_filtered[which(df.imdb_filtered$title_year>=1997),]

##
##Keep movies that have count with languages more than 5 only
##
language_to_keep<-as.data.frame(count(df.imdb_filtered,"language")) %>% arrange(desc(freq)) %>% filter(freq >=5) %>% select(language)

language_to_keep<-unlist(language_to_keep,use.names=FALSE) ##flatten list ##https://stackoverflow.com/a/17094791/2740831

head(language_to_keep)
df.imdb_filtered<-df.imdb_filtered[(df.imdb_filtered$language %in% (language_to_keep)),]

##
###get list of countries with count as one
##
countries_to_keep<-as.data.frame(count(df.imdb_filtered,"country")) %>% arrange(desc(freq)) %>% filter(freq>=2) %>% select(country)

countries_to_keep<-unlist(countries_to_keep,use.names=FALSE)
head(countries_to_keep)

df.imdb_filtered<-df.imdb_filtered[(df.imdb_filtered$country %in% (countries_to_keep)),]
head(df.imdb_filtered)
which(df.imdb_filtered$country=="") ###  check if any movie with no country name

##-get count of content ratings and sort by desc
as.data.frame(count(df.imdb_filtered,"content_rating"))  %>% arrange(desc(freq))

head(df.imdb_filtered[which(df.imdb_filtered$content_rating=="Unrated"),1:12])

as.data.frame(count(df.imdb_filtered,"content_rating")) %>%  summarize(totalsum = sum(freq, na.rm = TRUE)) ##make sure the count makes sense with dim

dim(df.imdb_filtered) ##get dim of data frame

##Get minimum and maximum year of the movies launched
min(df.imdb_filtered$title_year)

##get count of movies and sort them in desc
count(df.imdb_filtered,"title_year") %>% arrange((title_year))

## Get language of the movies in this duration
as.data.frame(count(df.imdb_filtered,"language")) %>% arrange(freq)


##
##
##

