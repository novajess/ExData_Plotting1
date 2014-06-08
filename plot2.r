data <- read.table('C:\\Users\\Jessica\\Documents\\Personal\\household_power_consumption.txt', 
                   sep=";",header=TRUE)
head(data)
data$Date_time <- paste(data$Date, data$Time)
data$Date_time <- strptime(as.character(data$Date_time), format="%d/%m/%Y %H:%M:%S")
head(data)


data2 <- data[which(data[,1] %in% c("1/2/2007", "2/2/2007")),]
head(data2)

data2$Global_active_power <- as.numeric(data2$Global_active_power)

#Plot 2
with(data2, plot(Date_time, Global_active_power / 500, type="l", 
                 ylab="Global Active Power (kilowatts)", xlab = ""))


dev.copy(png, "plot2.png")
dev.off()

