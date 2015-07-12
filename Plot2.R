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

#PLOT2
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", 
    bg = "white")

plot(data$CompleteTime,data$Global_active_power,type="l",
     xlab="",ylab="Global Active Power (kilowatts)")

dev.off()