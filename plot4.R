#Author: Andrew Ching
#Course Name: EDA, Project 1 - Assignment 4

# read in dataaset
ecPower <- read.csv2('household_power_consumption.txt', sep=';', stringsAsFactors = FALSE)

# filter with the date as of 2007-02-01 and 2007-02-02
ecFilter <- subset(ecPower, Date %in% c("1/2/2007", "2/2/2007") )

# formatting
ecFilter$dateTime <- strptime(paste(ecFilter$Date, ecFilter$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
ecFilter$Global_active_power <- as.numeric(ecFilter$Global_active_power)
ecFilter$Global_reactive_power <- as.numeric(ecFilter$Global_reactive_power)
ecFilter$Voltage <- as.numeric(ecFilter$Voltage)
ecFilter$subMetering1 <- as.numeric(ecFilter$Sub_metering_1)
ecFilter$subMetering2 <- as.numeric(ecFilter$Sub_metering_2)
ecFilter$subMetering3 <- as.numeric(ecFilter$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

with(ecFilter, plot(dateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.5))

with(ecFilter, plot(dateTime, Voltage, type="l", xlab="datetime", ylab="Voltage"))

with(ecFilter, plot(dateTime, subMetering1, type="l", ylab="Energy Submetering", xlab=""))

with(ecFilter, lines(dateTime, subMetering2, type="l", col="red"))

with(ecFIlter, lines(dateTime, subMetering3, type="l", col="blue"))

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=3, col=c("black", "red", "blue"), bty="o")

with(ecFilter, plot(dateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

dev.off()