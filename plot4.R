library(data.table)

data <- fread("household_power_consumption.txt", sep=";",na.strings="?")
data <- data[Date %in% c("1/2/2007", "2/2/2007")]
data <- data[, Datetime:=as.POSIXct(paste(Date,Time), format="%d/%m/%Y %H:%M:%S")]

png("plot4.png", 480, 480)

par(mfcol=c(2,2))

plot(data$Datetime, data$Global_active_power, type="l", ylab="Global Active Power", xlab="")

plot(data$Datetime, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
points(data$Datetime, data$Sub_metering_2, type="l", col="red")
points(data$Datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n")

plot(data$Datetime, data$Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(data$Datetime, data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()