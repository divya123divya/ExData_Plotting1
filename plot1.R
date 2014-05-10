#code for drawing plot2.R
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
hist(x = complete_dataset$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.print(png,file='plot.png', width=480, height=480)
dev.off()
