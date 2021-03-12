library(data.table)

windows(480, 480)

data <- fread("household_power_consumption.txt", sep=";",na.strings="?")
data <- data[Date %in% c("1/2/2007", "2/2/2007")]
data <- data[, Datetime:=as.POSIXct(paste(Date,Time), format="%d/%m/%Y %H:%M:%S")]

plot(data$Datetime, data$Global_active_power, type="l", ylab="Global Active Power", xlab="")

dev.copy(png, file="plot2.png")
dev.off()