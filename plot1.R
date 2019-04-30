## This script creates the first plot in the Exploratoty Data Analysis Week 1 Assignment

library(dplyr)

# Read in the household power consumption data
dfile <- "./household_power_consumption.txt"
data <- read.table(dfile, sep = ";", header = TRUE)

# Filter data for 2007-02-01 and 2007-02-02
data <- data %>% filter(Date == "2/1/2007" | Date == "2/2/2007")

# Convert date and time variables from factors
data$Date <- as.Date(data$Date, format = "%m/%d/%Y")
data$Time <- strptime(c(data$Time), format = "%H:%M:%S")
