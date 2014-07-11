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
png(filename="plot2.png", height=480, width=480, bg="transparent")

# Plot
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Close device
dev.off()




