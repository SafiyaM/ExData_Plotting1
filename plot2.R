# Exploratory Data Analysis Course
# Class Project 1

setwd("C:/Users/Safiya/Desktop/Coursera Data Science/exploratoryDataAnalysis")

fileName <- "household_power_consumption.txt"
data <- read.delim(fileName, header = TRUE, sep = ";", stringsAsFactors = FALSE, 
                   na.strings = "?")

data$Date2 <- paste(data$Date, data$Time)
data$Date3 <- strptime(data$Date2, "%d/%m/%Y %H:%M:%S") ##convert to time format



#subset dates to 2007-02-01 and 2007-02-02
power <- data[format(data$Date3, "%Y-%m-%d") == "2007-02-01" |
                format(data$Date3, "%Y-%m-%d") == "2007-02-02",]


# Plot 2
# Line Graph
# X-axis: Date Time
# Y-axis: Global Active Power in Kilowats
png("./plot2.png", width = 480, height = 480)

with(power, plot(Date3, Global_active_power, type = "l", 
                 ylab = "Global Active Power (kilowatts)", xlab = ""))

dev.off()