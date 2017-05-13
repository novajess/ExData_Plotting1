dataseturl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataseturl, "power.zip")
unzip("power.zip", exdir = "power")
list.files("power", full.names = TRUE)

data <- read.table("power/household_power_consumption.txt", sep=";",header=TRUE)
head(data)
for(i in 3:9){
    data[,i] <- as.numeric(as.character(data[,i]))
}

data2 <- data[which(data$Date %in% c("1/2/2007", "2/2/2007")),]
head(data2)
data2$Date_Time <- paste(data2$Date, data2$Time)
data2$Date_Time <- strptime(data2$Date_Time, format = "%d/%m/%Y %H:%M:%S")

#Plot 4
par(mfcol=c(2,2), mar=c(4,4,1,1))

#first plot
with(data2, plot(Date_Time, Global_active_power / 500, type="l", 
                 ylab="Global Active Power (kilowatts)", xlab = ""))

#second plot
with(data2, plot(Date_Time, Sub_metering_1, type="n", 
                 ylab="Energy sub metering", xlab = ""))
lines(data2$Date_Time, data2$Sub_metering_1)
lines(data2$Date_Time, data2$Sub_metering_2, col = "red")
lines(data2$Date_Time, data2$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red", "blue"), lty=c(1,1,1))

#third plot
with(data2, plot(Date_Time, Voltage / 10, type="l", xlab="datetime", ylab="Voltage"))

#fourth plot
with(data2, plot(Date_Time, 
                 Global_reactive_power / 1000, type="l", 
                 xlab="datetime", ylab = "Global_reactive_power"))

dev.copy(png, "plot4.png")
dev.off()
