setwd("~/Data Science/Exploratory Data Anlaysis")

# read data

myData <- read.csv("household_power_consumption.txt", header = TRUE, na.strings="?", 
                   nrows=2075259, sep = ";", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Limit data between Feb 01 and Feb 02 2007
myData <- subset(myData, Date== "1/2/2007" | Date == '2/2/2007')

# Convert Data

datetime <- paste(as.Date(data$Date), data$Time)
myData$Datetime <- as.POSIXct(datetime)


#Plot 2 xyplot
plot(myData$Datetime, myData$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## save to PNG file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
