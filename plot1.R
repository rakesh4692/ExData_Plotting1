## SETTING WORKING DIRECTORY TO DATA CONTAINING FOLDER USING setwd()
## Load in necessary libraries

library(data.table)
## Reads in data from file
hpc<-fread("./household_power_consumption.txt",sep = ";")

## Reada the data for given date range i.e. (2007-02-01 to 2007-02-02)
date_range<-filter(hpc,grep("^[1,2]/2/2007",Date))
## converting class of Global_active_power to numeric plotting for given date range i.e. (2007-02-01 to 2007-02-02) 
hist(as.numeric(date_range$Global_active_power),col ="red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
## copying to png 480px*480px
dev.copy(png,file="plot1.png",480,480)
dev.off()