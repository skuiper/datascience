### Full Code (importing data) in ExploratoryDataProj1.R

### Plot 2
plot(HPower$DateTime,HPower$Global_active_power,type = "l", 
     ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
cat("Plot2.png has been saved in", getwd())