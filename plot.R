data <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
globalActivePower <- as.numeric(subsetdata$Global_active_power)
globalReactivePower <- as.numeric(subsetdata$Global_reactive_power)
voltage <- as.numeric(subsetdata$Voltage)
subMetering1 <- as.numeric(subsetdata$Sub_metering_1)
subMetering2 <- as.numeric(subsetdata$Sub_metering_2)
subMetering3 <- as.numeric(subsetdata$Sub_metering_3)
#plot1
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", height=480, width=480) 
dev.off()
#plot2
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)  
dev.off()
#plot3
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.copy(png, file="plot3.png", height=480, width=480)   
dev.off()
#plot4
par(mfrow = c(2, 2)) 
# First plot
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
# Second plot
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
# Third plot
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
# Fourth plot
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power", cex=0.2)
dev.copy(png, file="plot4.png", height=480, width=480)    
dev.off()
