setwd("C:/Users/KUIPERS/Desktop/RStudio/datasciencecoursera/ExploratoryData")

#  Reading in data
if(!file.exists("household_power_consumption.txt")) {
  temp1 <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp1)
  HPower1 <- unzip(temp1)
  unlink(temp1)
  }

HPower <- read.table(HPower1, header=T, sep=";", na.strings ="?", stringsAsFactors = FALSE)

#  Formatting Data
HPower$DateTime <- as.POSIXct(paste(HPower$Date, HPower$Time), format = "%d/%m/%Y %T")
HPower$Date <- as.Date(HPower$Date, format="%d/%m/%Y")

#Restrict Data to 2007-02-01 and 2007-02-02
HPower <- HPower[(HPower$Date=="2007-02-01") | (HPower$Date=="2007-02-02"),]

### Plot 1
hist(HPower$Global_active_power, main = paste("Global Active Power"), 
     col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
cat("Plot1.png has been saved in", getwd())



### Plot 2
plot(HPower$DateTime,HPower$Global_active_power,type = "l", 
     ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
cat("Plot2.png has been saved in", getwd())

### Plot 3
plot(HPower$DateTime,HPower$Sub_metering_1,type = "n", ylab="Global Active Power (kilowatts)")
lines(HPower$DateTime,HPower$Sub_metering_1, col="black",  ylab="Global Active Power (kilowatts)")
lines(HPower$DateTime,HPower$Sub_metering_2, col="red",  ylab="Global Active Power (kilowatts)")
lines(HPower$DateTime,HPower$Sub_metering_3, col="blue", ylab="Global Active Power (kilowatts)")
legend("topright",
       lty=c(1,1,1),
       col =c("black","red","blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
cat("Plot3.png has been saved in", getwd())

### Plot 4
par(mfrow = c(2,2))
# First plot
plot(HPower$DateTime,HPower$Global_active_power,type = "l", 
     xlab = "", ylab="Global Active Power") 
# Second plot
plot(HPower$DateTime,HPower$Voltage,type = "l", 
     xlab = "datetime", ylab="Voltage") 
# Third plot
plot(HPower$DateTime,HPower$Sub_metering_1,type = "n", ylab="Global Active Power (kilowatts)")
lines(HPower$DateTime,HPower$Sub_metering_1, col="black",  ylab="Global Active Power (kilowatts)")
lines(HPower$DateTime,HPower$Sub_metering_2, col="red",  ylab="Global Active Power (kilowatts)")
lines(HPower$DateTime,HPower$Sub_metering_3, col="blue", ylab="Global Active Power (kilowatts)")
legend("topright",
       lty=c(1,1,1),
       col =c("black","red","blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Fourth plot
plot(HPower$DateTime,HPower$Global_reactive_power,type = "l", 
     xlab="datetime", ylab="Global_reactive_power") 

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
cat("Plot4.png has been saved in", getwd())
