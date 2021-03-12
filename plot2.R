library(data.table)

data <- fread("household_power_consumption.txt", sep=";",na.strings="?")
data <- data[Date %in% c("1/2/2007", "2/2/2007")]
data <- data[, Datetime:=as.POSIXct(paste(Date,Time), format="%d/%m/%Y %H:%M:%S")]

png("plot2.png", 480, 480)

plot(data$Datetime, data$Global_active_power, type="l", ylab="Global Active Power", xlab="")

dev.off()