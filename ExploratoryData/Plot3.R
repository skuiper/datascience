### Full Code (importing data) in ExploratoryDataProj1.R

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

