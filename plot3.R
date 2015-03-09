plot3 <- function () {
        ##get and clean data
        print("get and clean data, please wait...")
        power_data <- read.table("household_power_consumption.txt", sep = ";", colClasses = "character", header = T)
        power_data$Datetime <- paste(power_data$Date, power_data$Time)
        power_data$Datetime <- strptime(power_data$Datetime, format = "%d/%m/%Y %H:%M:%S")
        power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")
        power_data$Time <- strptime(power_data$Time, format = "%H:%M:%S")
        for (i in 3:9){power_data[,i] <- as.numeric(power_data[,i])}
        power_subset <- power_data[power_data$Date == "2007-02-01" | power_data$Date == "2007-02-02",]
        ##Plot3
        print("start plot")
        png(filename = "plot3.png")
        with(power_subset,plot(x = Datetime, y = Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
        with(power_subset, {plot(x = Datetime, y = Sub_metering_1, type = "l", ylab = "Energy sub metering",xlab = "")
                            lines(x = Datetime, y = Sub_metering_2, type = "l", col = "red")
                            lines(x = Datetime, y = Sub_metering_3, type = "l", col = "blue")
                            legend("topright",lty = "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        })
        dev.off()
        print("plot success.")
}