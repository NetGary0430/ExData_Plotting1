## Exploratory Data Analysis Project #1

## Read the data into a data frame

housePwr <- read.table("./household_power_consumption.txt", header = TRUE, 
                       sep = ";", na.strings = "?")

## Use the very useful %in% function to look for items that fall on the dates in question
## Note that %in% is used like this
## >6:10 %in% 1:36
## [1] TRUE TRUE TRUE TRUE TRUE5
## it returns TRUE where 1, 2, 3, etc. is in the list 1, 2, 3, ... 35, 36

febData <- housePwr[housePwr$Date %in% c("1/2/2007","2/2/2007") ,]

## Configure the date and time for the graph
## Subset the global active power that will be graphed

datetime <- strptime(paste(febData$Date, febData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(febData$Global_active_power)
GRP <- as.numeric(febData$Global_reactive_power)

voltage <- as.numeric(febData$Voltage)

subMetering1 <- as.numeric(febData$Sub_metering_1)
subMetering2 <- as.numeric(febData$Sub_metering_2)
subMetering3 <- as.numeric(febData$Sub_metering_3)

## Plot the graph
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")

## PRint to the file
dev.off()











