#code for drawing plot4.R
#set path for working directory
#refered from-https://class.coursera.org/exdata-002/forum/thread?thread_id=47
setwd("/Users/Divya")
require("sqldf")
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "/Users/Divya/household_power_consumption.txt"
# reading.csv file
myData <- read.csv2.sql(myFile,mySql)
#combining data and time
combine_DateTime <- paste(myData$Date, myData$Time)
Formated_DateTime <- strptime(combine_DateTime, "%d/%m/%Y %H:%M:%S")
myData$DateTime <- Formated_DateTime
complete_dataset <- na.omit(myData)
par(mfcol=c(2, 2))
plot(complete_dataset$DateTime, complete_dataset$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(complete_dataset$DateTime, complete_dataset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(complete_dataset$DateTime, complete_dataset$Sub_metering_2, type="l", xlab="", ylab="Energy sub metering", col="red")
lines(complete_dataset$DateTime, complete_dataset$Sub_metering_3, type="l", xlab="", ylab="Energy sub metering", col="blue")
legend("topright", pch="", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(complete_dataset$DateTime, complete_dataset$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(complete_dataset$DateTime, complete_dataset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.print(png,file='plot4.png', width=480, height=480)
dev.off()
