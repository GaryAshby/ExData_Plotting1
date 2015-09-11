#open plot device called plot3.png
png('plot3.png', width = 480, height = 480)

#read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
datetime <- strptime(paste(as.character(data$Date), as.character(data$Time)), "%d/%m/%Y %H:%M:%S")
data <- cbind(data,datetime)
data <- data[data$Date %in% c('1/2/2007','2/2/2007'),]

weekday <- weekdays(data$datetime)
data <- cbind(data, weekday)

with(data, plot(datetime, Sub_metering_1, type = 'l' , xlab = '', ylab = 'Energy sub metering'))
with(data, lines(datetime, Sub_metering_2, type = 'l', col = 'red'))
with(data, lines(datetime, Sub_metering_3, type = 'l', col = 'blue'))
legend('topright', col = c('black','red','blue'), legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), pch =  NA, lwd = 1)

#close device
dev.off()    