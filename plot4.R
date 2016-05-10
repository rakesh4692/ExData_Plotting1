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
## Setting graphing parameters so that 4 graphs are drawn by column
par(mfrow=c(2,2))

## converting class of Global_active_power to numeric plotting for given date range i.e. (2007-02-01 to 2007-02-02) 
plot(date_time1,as.numeric(date_range$Global_active_power),type = "l",xlab=" " ,ylab = "Global Active Power (kilowatts)")

## plotting between datetime and voltage for given date range i.e. (2007-02-01 to 2007-02-02) 
plot(date_time1,as.numeric(date_range$Voltage),type="l",xlab = "datetime",ylab = "Voltage")

## Creates plot of date/time v Sub metering 1
plot(date_time1,as.numeric(date_range$Sub_metering_1),type = "l",xlab = "", ylab = "Energy sub metering",col="black")
##Adds line graph for date/time v Sub metering 2 data in red and sub metering 3 data in blue
{lines(date_time1,as.numeric(date_range$Sub_metering_2),type = "l",col="red")
lines(date_time1,as.numeric(date_range$Sub_metering_3),type = "l",col="blue")
## adding legends
legend("topright",lty=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
}
plot(date_time1,as.numeric(date_range$Global_reactive_power),type = "l",xlab="datetime " ,ylab = "Global_reactive_power")
## copying to png 480px*480px
dev.copy(png,file="plot4.png",480,480)
dev.off()
