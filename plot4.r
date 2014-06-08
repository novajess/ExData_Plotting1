data <- read.table('C:\\Users\\Jessica\\Documents\\Personal\\household_power_consumption.txt', 
                   sep=";",header=TRUE)
head(data)
data$Date_time <- paste(data$Date, data$Time)
data$Date_time <- strptime(as.character(data$Date_time), format="%d/%m/%Y %H:%M:%S")
head(data)


data2 <- data[which(data[,1] %in% c("1/2/2007", "2/2/2007")),]
head(data2)

data2$Global_active_power <- as.numeric(data2$Global_active_power)

#Plot 4
par(mfcol=c(2,2), mar=c(4,4,1,1))

#first plot
with(data2, plot(Date_time, Global_active_power / 500, type="l", 
                 ylab="Global Active Power (kilowatts)", xlab = ""))

#second plot
with(data2, plot(Date_time, Sub_metering_1, type="n", 
                 ylab="Energy sub metering", xlab = ""))
lines(data2$Date_time, data2$Sub_metering_1)
lines(data2$Date_time, data2$Sub_metering_2, col = "red")
lines(data2$Date_time, data2$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red", "blue"), lty=c(1,1,1))

#third plot
with(data2, plot(Date_time, as.numeric(Voltage) / 10, type="l", xlab="datetime", ylab="Voltage"))

#fourth plot
with(data2, plot(Date_time, 
                 as.numeric(Global_reactive_power) / 1000, type="l", 
                 xlab="datetime", ylab = "Global_reactive_power"))



dev.copy(png, "plot4.png")
dev.off()
