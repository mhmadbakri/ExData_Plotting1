library(data.table)
data <- as.data.table(read.table("household_power_consumption.txt",sep = ";",header = TRUE, stringsAsFactors = FALSE, dec ="."))
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

subSetData <- transform(subSetData, Date = as.Date(subSetData$Date,'%d/%m/%Y'),
                        Sub_metering_1 = as.numeric(Sub_metering_1),
                        Sub_metering_2 = as.numeric(Sub_metering_2),
                        Sub_metering_3 = as.numeric(Sub_metering_3))

png("plot3.png", width = 480, height = 480)
with(subSetData, plot(Sub_metering_1, type = "n", axes = F, ylab = "Energy sub metering", xlab =""))
with(subSetData, lines(Sub_metering_1,col="black"))
with(subSetData, lines(Sub_metering_2,col="red"))
with(subSetData, lines(Sub_metering_3,col="blue"))
axis(side=1, at=c(0,1441, 2880),labels= c("Thu","Fri","Sat"))
axis(side=2)
box()
legend("topright" , lwd = 2, col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()