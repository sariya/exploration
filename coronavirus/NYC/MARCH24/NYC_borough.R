
##
##Date 03/25/2020

## source  https://www1.nyc.gov/assets/doh/downloads/pdf/imm/covid-19-daily-data-summary.pdf

.libPaths(c("/Users/sanjeevsariya/R_LIB",.libPaths()))
library(ggplot2)
library(gridExtra)

#################
#Cases 
#################
df_boroughcases<-data.frame("borough"=c("Manhattan","Queens","Staten Island","Bronx","Brooklyn","Unknown"),"Cases"=c(3013,4667,999,2505,4407,6))

cases<-ggplot(data=df_boroughcases, aes(x=borough, 
y=Cases,  fill=borough)) + 
geom_bar(stat="identity",show.legend = FALSE,colour="black")+
labs(title="COVID-19 Cases in NYC Boroughs until March 24", x ="Boroughs", y = "Number of Cases") +
theme_bw() +
theme(
plot.title = element_text( size=12, face="bold.italic"),
axis.title.x = element_text(size=12, face="bold"),
axis.title.y = element_text(size=12, face="bold"),
axis.text.y = element_text(size=10, face="bold"),
axis.text.x = element_text(size=10, face="bold")
) 

#################
#Deaths 
#################
  
df_borough_death<-data.frame("borough"=c("Manhattan","Queens","Staten Island","Bronx","Brooklyn"),"deaths"=c(30,61,18,41,42))

deaths<-ggplot(data=df_borough_death, aes(x=borough, 
y=deaths,  fill=borough)) + 
geom_bar(stat="identity",show.legend = FALSE,colour="black")+
labs(title="COVID-19 Deaths in NYC Boroughs until March 24", x ="Boroughs", y = "Number of Deaths") +
theme_bw() +
theme(
plot.title = element_text( size=12, face="bold.italic"),
axis.title.x = element_text(size=12, face="bold"),
axis.title.y = element_text(size=12, face="bold"),
axis.text.y = element_text(size=10, face="bold"),
axis.text.x = element_text(size=10, face="bold")
)






