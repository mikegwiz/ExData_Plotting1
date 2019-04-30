## This script creates the fourth plot in the Exploratoty Data Analysis Week 2 Assignment

library(dplyr)

# Read in the household power consumption data
dfile <- "./household_power_consumption.txt"
data <- read.table(dfile, sep = ";", header = TRUE)

# Filter data for 2007-02-01 and 2007-02-02
data <- data %>% filter(Date == "1/2/2007" | Date == "2/2/2007")

# Convert date and time variables from factors in a new variable "datetime"
data$datetime <- strptime(paste(as.character(data$Date), as.character(data$Time), sep = "."), format = "%d/%m/%Y.%H:%M:%S")

# Create Plot 3 to png device
  # Change factors to numbers for plot 
ydata1 <- as.numeric(as.character(data$Global_active_power))
ydata2 <- as.numeric(as.character(data$Voltage))
ydata3 <- as.numeric(as.character(data$Global_reactive_power))
xdata <- data$datetime

xdata1 <- as.numeric(as.character(data$Sub_metering_1))
xdata2 <- as.numeric(as.character(data$Sub_metering_2))

table(data$Global_reactive_power == "?")

# Makes plot in png device
png("plot4.png")

  # Sets the 2 by 2 plot environment and sets margins
par(mfrow = c(2,2), mar = c(4,4,1,1))

  # Upperleft plot
plot(xdata, ydata1, type = "l", ylab = "Global Active Power", xlab = "")

  # Upperright plot
plot(xdata, ydata2, type = "l", ylab = "Voltage", xlab = "datetime")

  #Lowerleft plot
plot(data$datetime, xdata1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(xdata, xdata1)
lines(xdata, xdata2, col="red")
lines(xdata, data$Sub_metering_3, col="blue")
legend ("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        lty = 1, col= c("black","red","blue"), bty = "n")

  #Lowerright plot
plot(xdata, ydata3, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()
