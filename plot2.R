#open plot device called plot2.png
png('plot2.png', width = 480, height = 480)

#read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
datetime <- strptime(paste(as.character(data$Date), as.character(data$Time)), "%d/%m/%Y %H:%M:%S")
data <- cbind(data,datetime)
data <- data[data$Date %in% c('1/2/2007','2/2/2007'),]

weekday <- weekdays(data$datetime)
data <- cbind(data, weekday)

with(data, plot(datetime, Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)'))

#close device
dev.off()    