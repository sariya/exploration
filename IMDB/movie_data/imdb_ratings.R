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

##filter data based on language
df.imdb_filtered<-df.imdb_filtered[-c(which(df.imdb_filtered$language=="" | df.imdb_filtered$language=="None")),]
print(dim(df.imdb_filtered))

count(df.imdb_filtered,"title_year")
##--let us work with movies from 1997 only

length(which(df.imdb_filtered$title_year>=1997)) ## get count of movies after 1999 onlywe work with last 20 years of data only 

df.imdb_filtered<-df.imdb_filtered[which(df.imdb_filtered$title_year>=1997),]

language_to_keep<-count(df.imdb_filtered,"language") %>% arrange(desc(freq)) %>% filter(freq >=5) %>% select(language)
c(language_to_keep)

head(df.imdb_filtered)
kk<-df.imdb_filtered[(df.imdb_filtered$language %in% c(language_to_keep)),]
head(kk)


df.imdb_filtered[is.element(df.imdb_filtered$language,c(language_to_keep)),]
##-get count of content ratings and sort by desc
as.data.frame(count(df.imdb_filtered,"content_rating"))  %>% arrange(desc(freq))
head(df.imdb_filtered[which(df.imdb_filtered$content_rating=="Unrated"),1:12])

as.data.frame(count(df.imdb_filtered,"content_rating")) %>%  summarize(totalsum = sum(freq, na.rm = TRUE)) ##make sure the count makes sense with dim

dim(df.imdb_filtered) ##get dim of data frame

##get counts of different year launched

##Get minimum and maximum year of the movies launched
min(df.imdb_filtered$title_year)

##get count of movies and sort them in desc
count(df.imdb_filtered,"title_year") %>% arrange((title_year))

## Get language of the movies in this duration
names(df.imdb)



