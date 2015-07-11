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

## Subset the global active power that will be graphed

GAP <- as.numeric(febData$Global_active_power)

## Plot the graph

png("plot1.png", width=480, height=480)
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## The following command causes the plot to finish writing to file
dev.off()










