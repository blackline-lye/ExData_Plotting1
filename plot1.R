library(data.table)

windows(480, 480)

data <- fread("household_power_consumption.txt", sep=";",na.strings="?")
data <- data[Date %in% c("1/2/2007", "2/2/2007")]
data <- data[, Datetime:=as.POSIXct(paste(Date,Time), format="%d/%m/%Y %H:%M:%S")]

hist(data$Global_active_power, main="Global Active Power", col="red", ylab="Frequency", xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png")
dev.off()