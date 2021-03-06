setwd("~/Data Science/Exploratory Data Anlaysis")

# read data

myData <- read.csv("household_power_consumption.txt", header = TRUE, na.strings="?", 
                   nrows=2075259, sep = ";", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')


# Limit data between Feb 01 and Feb 02 2007
myData <- subset(myData, Date== "1/2/2007" | Date == '2/2/2007')

#Plot 1 Histogram
hist(myData$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## save to PNG file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
