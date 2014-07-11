# Assume that the data file is located in data directory

# The file has header and separator is ; and the sign for missing value is ?
data <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Conver Date column to Date type and create a new column DateTeim by combining Date and Time

data$DateTime = paste(data$Date, data$Time, sep=' ')
data$DateTime <-strptime(data$DateTime, format='%d/%m/%Y %H:%M:%S')
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Select observations of 2 days.
data <- subset(data, data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"))

# Save png file with size 480 pixels * 480 pixels
png(filename="plot3.png", height=480, width=480, bg="transparent")

# Plot
plot(data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1))

# Close device
dev.off()
