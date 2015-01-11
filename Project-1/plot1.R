setwd("~/Data Science/Exploratory Data Anlaysis")

# read data

myData <- read.csv("household_power_consumption.txt", header = TRUE, 
                   sep = ";")

# Convert Data

myData$DateTime <- strptime(paste(myData$Date, myData$Time), "%d/%m/%Y %H:%M:%S")
myData$Date <- as.Date(myData$Date, format="%d/%m/%Y")

myData$Global_active_power <- as.numeric(myData$Global_active_power)


# Limit data between Feb 01 and Feb 02 2007
myData <- subset(myData, Date>= "2007-02-01"& Date <= '2007-02-02')

#Plot 1 Histogram
hist(myData$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## save to PNG file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
