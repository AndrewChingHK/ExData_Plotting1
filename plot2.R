#Author: Andrew Ching
#Course Name: EDA, Project 1 - Assignment 2

# read in dataaset
ecPower <- read.csv2('household_power_consumption.txt', sep=';', stringsAsFactors = FALSE)

# filter with the date as of 2007-02-01 and 2007-02-02
ecFilter <- subset(ecPower, Date %in% c("1/2/2007", "2/2/2007") )

# perform formatting
ecFilter$dateTime <- strptime(paste(ecFilter$Date, ecFilter$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
ecFilter$Global_active_power <- as.numeric(ecFilter$Global_active_power)

png("plot2.png", width=480, height=480)
with(ecFilter, plot(dateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()


