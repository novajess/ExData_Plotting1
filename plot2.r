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

#Plot 2
with(data2, plot(Date_Time, Global_active_power / 500, type="l", 
                 ylab="Global Active Power (kilowatts)", xlab = ""))
dev.copy(png, "plot2.png")
dev.off()

