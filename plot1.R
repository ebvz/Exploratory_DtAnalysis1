## Getting ALL dataset
All_data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
All_data$Date <- as.Date(All_data$Date, format="%d/%m/%Y")

## Subsetting the data
dt0102Feb <- subset(All_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(All_data)

## Converting dates
datetime <- paste(as.Date(dt0102Feb$Date), dt0102Feb$Time)
dt0102Feb$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(dt0102Feb$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()