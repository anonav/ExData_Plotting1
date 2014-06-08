library(data.table)
data<- fread("household_power_consumption.txt", na.strings = "?")

data$Date <- as.Date(data$Date, format ="%d/%m/%Y")
datasub <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02" ,]

datasub$Global_active_power <- as.numeric(datasub$Global_active_power)

datasub$Date <- as.character(datasub$Date)
DateTime<- strptime(paste(datasub$Date, datasub$Time), format = "%Y-%m-%d %H:%M:%S")
y <- cbind(datasub$Sub_metering_1,datasub$Sub_metering_2,datasub$Sub_metering_3)

png(file = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

plot(DateTime,datasub$Global_active_power, xlab="",ylab = "Global Active Power",main = "",type = "n")
lines(DateTime,datasub$Global_active_power, type = "l")


plot(DateTime,datasub$Voltage, xlab="datetime",ylab = "Voltage",main = "",type = "n")
lines(DateTime,datasub$Voltage, type = "l")

plot(DateTime,datasub$Sub_metering_1, xlab="",ylab = "Energy sub metering",main = "",type = "n")
lines(DateTime,datasub$Sub_metering_1, type = "l")
lines(DateTime,datasub$Sub_metering_2, type = "l", col = "red")
lines(DateTime,datasub$Sub_metering_3, type = "l",col = "blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, col=c('black','red', 'blue'))

plot(DateTime,datasub$Global_reactive_power, xlab="datetime",ylab = "Global_reactive_power",main = "",type = "n")
lines(DateTime,datasub$Global_reactive_power, type = "l")

dev.off()
