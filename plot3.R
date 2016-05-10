## SETTING WORKING DIRECTORY TO DATA CONTAINING FOLDER USING setwd()
## Load in necessary libraries
library(dplyr)
library(data.table)

## Reads in data from file
hpc<-fread("./household_power_consumption.txt",sep = ";", na.strings = "?")

## Reada the data for given date range i.e. (2007-02-01 to 2007-02-02)
date_range<-filter(hpc,grep("^[1,2]/2/2007",Date))
## extracting date and time and pasting them together
date_time<-paste(date_range$Date,date_range$Time)
##  class(date_time)
## [1] "character"

date_time1<-strptime(date_time,"%d/%m/%Y %H:%M:%S")
## class(date_time1)
## [1] "POSIXlt" "POSIXt"

## plotting between date time and Energy sub metering here type =l i.e. (l=lines)
## Creates plot of date/time v Sub metering 1
plot(date_time1,as.numeric(date_range$Sub_metering_1),type = "l",xlab = "", ylab = "Energy sub metering",col="black")

##Adds line graph for date/time v Sub metering 2 data in red
lines(date_time1,as.numeric(date_range$Sub_metering_2),type = "l",col="red")

##Adds line graph for date/time v Sub metering 3 data in blue
lines(date_time1,as.numeric(date_range$Sub_metering_3),type = "l",col="blue")
##Adds legend to graph
legend("topright",lty=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))



## copying to png 480px*480px
dev.copy(png,file="plot3.png",480,480)
dev.off()