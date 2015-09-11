#read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
datetime <- strptime(paste(as.character(data$Date), as.character(data$Time)), "%d/%m/%Y %H:%M:%S")
data <- cbind(data,datetime)
data <- data[data$Date %in% c('1/2/2007','2/2/2007'),]

weekday <- weekdays(data$datetime)
data <- cbind(data, weekday)

#open plot device called plot1.png
png('plot4.png', width = 480, height = 480)

#row 2x2
par(mfrow = c(2, 2), mar = c(4, 4, 3, 2))
#Plot 1
with(data, plot(datetime, Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power'))
#Plot 2
with(data, plot(datetime, Voltage, type = 'l', ylab = 'Voltage'))
#Plot 3
with(data, plot(datetime, Sub_metering_1, type = 'l' , xlab = '', ylab = 'Energy sub metering'))
with(data, lines(datetime, Sub_metering_2, type = 'l', col = 'red'))
with(data, lines(datetime, Sub_metering_3, type = 'l', col = 'blue'))
legend('topright', col = c('black','red','blue'), legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), pch = NA, lwd = 1)
#Plot 4
with(data, plot(datetime, Global_reactive_power, type = 'l', ylab = 'Global_reactive_power'))

#close device
dev.off()    