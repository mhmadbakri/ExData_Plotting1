library(data.table)
data <- as.data.table(read.table("household_power_consumption.txt",sep = ";",header = TRUE, stringsAsFactors = FALSE, dec ="."))
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

GlobalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(GlobalActivePower, xlab = "Global Active Power (kilowatts)",main = "Global Active Power",col = "red")
dev.off()