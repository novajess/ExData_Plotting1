data <- read.table('C:\\Users\\Jessica\\Documents\\Personal\\household_power_consumption.txt', 
                   sep=";",header=TRUE)
head(data)

data2 <- data[which(data[,1] %in% c("1/2/2007", "2/2/2007")),]
head(data2)

data2$Date <- as.Date(as.character(data2$Date), format="%d/%m/%Y")
data2$Time <- strptime(as.character(data2$Time), format = "%H:%M:%S")
data2$Global_active_power <- as.numeric(data2$Global_active_power)
head(data2)

#Plot 1
hist(data2$Global_active_power / 500, col="red", main="Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, "plot1.png")
dev.off()
  
