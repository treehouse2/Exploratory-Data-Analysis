setwd("~/Data Science/Exploratory Data Anlaysis")

# read data

myData <- read.csv("household_power_consumption.txt", header = TRUE, na.strings="?", 
                   nrows=2075259, sep = ";", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Limit data between Feb 01 and Feb 02 2007
myData <- subset(myData, Date== "1/2/2007" | Date == '2/2/2007')

# Convert Data

datetime <- paste(as.Date(data$Date), data$Time)
myData$Datetime <- as.POSIXct(datetime)


## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(myData$Datetime, myData$Global_active_power, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(myData$Datetime, myData$Voltage, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(myData$Datetime, myData$Sub_metering_1, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(myData$Datetime, myData$Sub_metering_2,col='Red')
  lines(myData$Datetime, myData$Sub_metering_3,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(myData$Datetime, myData$Global_reactive_power, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})


## save to PNG file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
