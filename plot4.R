library(data.table)
data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE, stringsAsFactors = FALSE, dec =".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

globalActivePower <- as.numeric(subSetData$Global_active_power)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)
voltage <- as.numeric(subSetData$Voltage)
Global_reactive_power <- as.numeric(subSetData$Global_reactive_power)

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
plot(datetime, voltage, type="l", ylab="Voltage")

plot(datetime, subMetering1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", lwd=2.5, col=c("black", "red", "blue"))

plot(datetime, Global_reactive_power, type="l")
dev.off()
