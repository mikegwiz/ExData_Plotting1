## This script creates the third plot in the Exploratoty Data Analysis Week 2 Assignment

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
xdata1 <- as.numeric(as.character(data$Sub_metering_1))
xdata2 <- as.numeric(as.character(data$Sub_metering_2))


  # Makes plot in png device
png("plot3.png")

plot(data$datetime, xdata1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(data$datetime, xdata1)
lines(data$datetime, xdata2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")
legend ("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col= c("black","red","blue"))

dev.off()