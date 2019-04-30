## This script creates the second plot in the Exploratoty Data Analysis Week 2 Assignment

library(dplyr)

# Read in the household power consumption data
dfile <- "./household_power_consumption.txt"
data <- read.table(dfile, sep = ";", header = TRUE)

# Filter data for 2007-02-01 and 2007-02-02
data <- data %>% filter(Date == "1/2/2007" | Date == "2/2/2007")

# Convert date and time variables from factors in a new variable "datetime"
data$datetime <- strptime(paste(as.character(data$Date), as.character(data$Time), sep = "."), format = "%d/%m/%Y.%H:%M:%S")

# Create Plot 2 to png device
ydata <- as.numeric(as.character(data$Global_active_power))
xdata <- data$datetime

png("plot2.png")
plot(xdata, ydata, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
