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

# Plot 3
# Line Graph
# X-axis: Date Time
# Y-axis: Sub_metering_1, Sub_metering_2, and Sub_metering_3 should display separately
png("./plot3.png", width = 480, height = 480)

with(power, plot(Date3, Sub_metering_1, type = "l", xlab = "",
                 ylab = "Energy sub metering"))
with(power, lines(Date3, Sub_metering_2, col = "red"))
with(power, lines(Date3, Sub_metering_3, col = "blue"))
legend("topright", lty = c(1,1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
