data <- read.table('C:\\Users\\Jessica\\Documents\\Personal\\household_power_consumption.txt', 
                   sep=";",header=TRUE)
head(data)
data$Date_time <- paste(data$Date, data$Time)
data$Date_time <- strptime(as.character(data$Date_time), format="%d/%m/%Y %H:%M:%S")
head(data)


data2 <- data[which(data[,1] %in% c("1/2/2007", "2/2/2007")),]
head(data2)

data2$Global_active_power <- as.numeric(data2$Global_active_power)

#Plot 3
with(data2, plot(Date_time, Sub_metering_1, type="n", 
                 ylab="Energy sub metering", xlab = ""))
lines(data2$Date_time, data2$Sub_metering_1)
lines(data2$Date_time, data2$Sub_metering_2, col = "red")
lines(data2$Date_time, data2$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red", "blue"), lty=c(1,1,1))


dev.copy(png, "plot3.png")
dev.off()
