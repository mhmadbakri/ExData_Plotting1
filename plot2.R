library(data.table)
data <- as.data.table(read.table("household_power_consumption.txt",sep = ";",header = TRUE, stringsAsFactors = FALSE, dec ="."))
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

png("plot2.png", width = 480, height = 480)
plot(GlobalActivePower, type = "l", axes = F, xlab ="")
axis(side=1, at=c(0,1441, 2880),labels= c("Thu","Fri","Sat"))
axis(side=2)
box()
dev.off()