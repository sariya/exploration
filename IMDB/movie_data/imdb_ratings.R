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

names(df.imdb)

##Get counts of different ratings of the movie
count(df.imdb,"content_rating")

unique(df.imdb$content_rating)

##get counts of different year launched
count(df.imdb,"title_year")

##Get minimum and maximum year of the movies launched
min(df.imdb$title_year)

is.na(df.imdb$title_year)


df.imdb[4871:4873,1:12]

names(df.imdb)

