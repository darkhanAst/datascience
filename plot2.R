colnames <- c ("Date","Time","Global_active_power",
               "Global_reactive_power","Voltage",
               "Global_intensity","Sub_metering_1",
               "Sub_metering_2","Sub_metering_3")

data <- read.table("household_power_consumption.txt",header = TRUE,
                   sep = ";",skip = 66636, nrow = 2880,na.strings="?",col.names = colnames)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()