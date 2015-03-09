plot1 <- function () {
                ##get and clean data
                print("get and clean data, please wait...")
                power_data <- read.table("household_power_consumption.txt", sep = ";", colClasses = "character", header = T)
                power_data$Datetime <- paste(power_data$Date, power_data$Time)
                power_data$Datetime <- strptime(power_data$Datetime, format = "%d/%m/%Y %H:%M:%S")
                power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")
                power_data$Time <- strptime(power_data$Time, format = "%H:%M:%S")
                for (i in 3:9){power_data[,i] <- as.numeric(power_data[,i])}
                power_subset <- power_data[power_data$Date == "2007-02-01" | power_data$Date == "2007-02-02",]
                ##Plot1
                print("start plot")
                png(filename = "plot1.png")
                with(power_subset,hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
                dev.off()
                print("plot success.")
        }