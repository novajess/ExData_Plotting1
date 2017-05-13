dataseturl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataseturl, "power.zip")
unzip("power.zip", exdir = "power")
list.files("power", full.names = TRUE)

data <- read.table("power/household_power_consumption.txt", sep=";",header=TRUE)
head(data)
data2 <- data[which(data$Date %in% c("1/2/2007", "2/2/2007")),]
head(data2)

data2$Date <- as.Date(as.character(data2$Date), format = "%d/%m/%Y")
data2$Time <- strptime(as.character(data$Time), format = "%H:%M:%S")

data2 <- data[which(data$Date %in% c("2007-02-01", "2007-02-02")),]
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
  
