#Author: Andrew Ching
#Course Name: EDA, Project 1 - Assignment 3


# read in dataaset
ecPower <- read.csv2('household_power_consumption.txt', sep=';', stringsAsFactors = FALSE)

# filter with the date as of 2007-02-01 and 2007-02-02
ecFilter <- subset(ecPower, Date %in% c("1/2/2007", "2/2/2007") )

# formatting
ecFilter$dateTime <- strptime(paste(ecFilter$Date, ecFilter$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
ecFilter$Global_active_power <- as.numeric(ecFilter$Global_active_power)
ecFilter$subMetering1 <- as.numeric(ecFilter$Sub_metering_1)
ecFilter$subMetering2 <- as.numeric(ecFilter$Sub_metering_2)
ecFilter$subMetering3 <- as.numeric(ecFilter$Sub_metering_3)

png("plot3.png", width=480, height=480)
with(ecFilter, plot(dateTime, subMetering1, type="l", ylab="Energy sub metering", xlab=""))
with(ecFilter, lines(dateTime, subMetering2, type="l", col="red"))
with(ecFilter, lines(dateTime, subMetering3, type="l", col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=3, col=c("black", "red", "blue"))
dev.off()

