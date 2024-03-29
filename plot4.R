colnames <- c ("Date","Time","Global_active_power",
               "Global_reactive_power","Voltage",
               "Global_intensity","Sub_metering_1",
               "Sub_metering_2","Sub_metering_3")

data <- read.table("household_power_consumption.txt",header = TRUE,
                   sep = ";",skip = 66636, nrow = 2880,na.strings="?",col.names = colnames)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)



par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         cex=0.4)
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})


dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()