library(data.table)

data <- fread("household_power_consumption.txt", sep=";",na.strings="?")
data <- data[Date %in% c("1/2/2007", "2/2/2007")]
data <- data[, Datetime:=as.POSIXct(paste(Date,Time), format="%d/%m/%Y %H:%M:%S")]

png("plot3.png", 480, 480)

plot(data$Datetime, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
points(data$Datetime, data$Sub_metering_2, type="l", col="red")
points(data$Datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

dev.off()