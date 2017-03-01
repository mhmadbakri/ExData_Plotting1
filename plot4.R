library(data.table)
data <- as.data.table(read.table("household_power_consumption.txt",sep = ";",header = TRUE, stringsAsFactors = FALSE, dec ="."))
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

subSetData <- transform(subSetData, Date = as.Date(subSetData$Date,'%d/%m/%Y'),
                        Global_active_power = as.numeric(Global_active_power),
                        Global_reactive_power = as.numeric(Global_reactive_power),
                        Voltage = as.numeric(Voltage),
                        Global_intensity = as.numeric(Global_intensity),
                        Sub_metering_1 = as.numeric(Sub_metering_1),
                        Sub_metering_2 = as.numeric(Sub_metering_2),
                        Sub_metering_3 = as.numeric(Sub_metering_3))

png("plot4.png", width = 480, height = 480)
par(mfrow= c(2,2))
plot(subSetData$Global_active_power, type = "l", axes = F, xlab ="", ylab="Global Active Power")
axis(side=1, at=c(0,1441, 2880),labels= c("Thu","Fri","Sat"))
axis(side=2)
box()

plot(subSetData$Voltage, type = "l", axes = F,xlab ="datetime", ylab="Voltage")
axis(side=1, at=c(0,1441, 2880),labels= c("Thu","Fri","Sat"))
axis(side=2)
box()

with(subSetData, plot(Sub_metering_1, type = "n", axes = F, ylab = "Energy sub metering", xlab =""))
with(subSetData, lines(Sub_metering_1,col="black"))
with(subSetData, lines(Sub_metering_2,col="red"))
with(subSetData, lines(Sub_metering_3,col="blue"))
axis(side=1, at=c(0,1441, 2880),labels= c("Thu","Fri","Sat"))
axis(side=2)
legend("topright" , lwd = 2, col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")
box()

plot(subSetData$Global_reactive_power, type = "l", axes = F,xlab ="datetime", ylab="Global_reactive_power")
axis(side=1, at=c(0,1441, 2880),labels= c("Thu","Fri","Sat"))
axis(side=2)
box()
dev.off()