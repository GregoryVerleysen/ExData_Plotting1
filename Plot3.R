#COURSERA
#Exploratory Data Analysis Project 1
#Gregory Verleysen


setwd("~/COURSERA/Exploratory data analysis/Project1")

library(sqldf)
library(RH2)

### READING DATA
#file name
file <- "household_power_consumption.txt"
#only select data 1/2/2007 and 2/2/2007
select <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
#read in subset of data
data <- read.csv.sql(file, select, sep=";")
#combined date time variable
data$CompleteTime = strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%OS")
data$Date = as.Date(data$Date, format="%d/%m/%Y")

#PLOT3
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", 
    bg = "white")

plot(x=data$CompleteTime,y=data$Sub_metering_1,type="l",
     xlab="",ylab="Energy Sub Meetering")
lines(x=data$CompleteTime,y=data$Sub_metering_2, type="l",col="red")
lines(x=data$CompleteTime,y=data$Sub_metering_3, type="l",col="blue")
legendTxt <-c("Sub Meetering 1","Sub Meetering 2", "Sub Meetering 3")
legend("topright",c("Sub Metering 1","Sub Metering 2", "Sub Metering 3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))


dev.off()