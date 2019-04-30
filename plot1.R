## This script creates the first plot in the Exploratoty Data Analysis Week 1 Assignment

# Read in the household power consumption data
dfile <- "./household_power_consumption.txt"
data <- read.table(dfile, sep = ";", header = TRUE)

# Convert date and time variables from factors
data$Date <- sapply(data$Date, as.Date)
data$Time <- sapply(data$Time, strptime)