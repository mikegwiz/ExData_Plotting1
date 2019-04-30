## This script creates the first plot in the Exploratoty Data Analysis Week 1 Assignment

library(dplyr)

# Read in the household power consumption data
dfile <- "./household_power_consumption.txt"
data <- read.table(dfile, sep = ";", header = TRUE)

# Filter data for 2007-02-01 and 2007-02-02
data <- data %>% filter(Date == "1/2/2007" | Date == "2/2/2007")

# Convert date and time variables from factors in a new variable "datetime"
data$datetime <- strptime(paste(as.character(data$Date), as.character(data$Time), sep = "."), format = "%d/%m/%Y.%H:%M:%S")

# Create Plot 1
plotdata <- as.numeric(as.character(data$Global_active_power))

png("plot1.png")
hist(plotdata, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

