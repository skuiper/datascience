### Full Code (importing data) in ExploratoryDataProj1.R

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
