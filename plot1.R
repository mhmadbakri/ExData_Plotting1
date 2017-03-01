library(data.table)
data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE, stringsAsFactors = FALSE, dec =".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

globalActivePower <- as.numeric(subSetData$Global_active_power)

png("plot2.png", width = 480, height = 480)
hist(globalActivePower, xlab="Global Active Power (kilowatts)", col = "red")
dev.off()
