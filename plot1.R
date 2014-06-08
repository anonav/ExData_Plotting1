library(data.table)
data<- fread("household_power_consumption.txt", na.strings = "?")

data$Date <- as.Date(data$Date, format ="%d/%m/%Y")
datasub <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02" ,]

datasub$Global_active_power <- as.numeric(datasub$Global_active_power)

png(file = "plot1.png", width = 480, height = 480)
hist(datasub$Global_active_power, main = "Global Active Power", xlab ="Global Active Power (kilowatts)" , ylab="Frequency", col ="red")
dev.off()


