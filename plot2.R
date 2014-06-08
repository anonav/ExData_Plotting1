
library(data.table)
data<- fread("household_power_consumption.txt", na.strings = "?")

data$Date <- as.Date(data$Date, format ="%d/%m/%Y")
datasub <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02" ,]

datasub$Global_active_power <- as.numeric(datasub$Global_active_power)


datasub$Date <- as.character(datasub$Date)
DateTime<- strptime(paste(datasub$Date, datasub$Time), format = "%Y-%m-%d %H:%M:%S")

png(file = "plot2.png", width = 480, height = 480)
plot(DateTime,datasub$Global_active_power, xlab="",ylab = "Global Active Power (kilowatts)",main = "",type = "n")
lines(DateTime,datasub$Global_active_power, type = "l")
dev.off()