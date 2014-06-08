# Read entire dataset
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Combine and convert date and time variables
data$Date <- as.character(data$Date)
data$Time <- as.character(data$Time)

DateTime <- paste(data$Date,data$Time, sep = ' ')
data <- cbind(data, DateTime)
data$DateTime <- as.Date(data$DateTime, format = "%d/%m/%Y %H:%M:%S")

# Subset days 2/1/07 and 2/2/07
library(dplyr)
dataclean <- filter(data, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))

# Plot histogram
hist(dataclean$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

