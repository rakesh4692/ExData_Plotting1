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

## plotting between date time and global active power here type =l i.e. (l=lines) 
plot(date_time1,as.numeric(date_range$Global_active_power),type = "l",xlab=" " ,ylab = "Global Active Power (kilowatts)")

## copying to png 480px*480px
dev.copy(png,file="plot2.png",480,480)
dev.off()