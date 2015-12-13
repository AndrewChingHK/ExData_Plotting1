#Author: Andrew Ching
#Course Name: EDA, Project 1 - Assignment 1

# read in dataaset
ecPower <- read.csv2('household_power_consumption.txt', sep=';', stringsAsFactors = FALSE)

# filter with the date as of 2007-02-01 and 2007-02-02
ecFilter <- subset(ecPower, Date %in% c("1/2/2007", "2/2/2007") )

#histogram required a series of continuos numeric values, hence change from character to numeric
ecFilter$Global_active_power <- as.numeric(ecFilter$Global_active_power)

#output to OS
png("plot1.png", width=480, height=480)
hist(ecFilter$Global_active_power, breaks=12, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()


