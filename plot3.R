# Read entire dataset
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Subset days 2/1/07 and 2/2/07
data$Date <- as.character(data$Date)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- as.character(data$Time)
subset <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]

# Combine and convert date and time variables
DateTime <- paste(subset$Date,subset$Time, sep = ' ')
subset <- cbind(subset, DateTime)
subset$DateTime <- strptime(subset$DateTime, format = "%Y-%m-%d %H:%M:%S")

# Plot 3
quartz()
png(file = "plot3.png")
plot(subset$DateTime, subset$Sub_metering_1, col="black", type="l", ylab = "Energy sub metering", xlab="")
lines(subset$DateTime, subset$Sub_metering_2, col="red", type="l")
lines(subset$DateTime, subset$Sub_metering_3, type="l", col="blue")
legend("topright", lty=c(1,1) , col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
