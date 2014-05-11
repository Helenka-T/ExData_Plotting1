headers <- read.table("C:/Users/Elena/Desktop/household.txt", nrows = 1, header=T, sep=";")
data <- read.table("C:/Users/Elena/Desktop/household.txt", sep = ";", na.strings = "?", skip = 21997 + 1440 * 31, nrows = 2880, col.names=names(headers))

data$datetime <- paste(data$Date, data$Time, sep = " ")
data$datetime <-  as.POSIXct(strptime(data$datetime, "%d/%m/%Y %H:%M:%S"))

png("C:/Users/Elena/Desktop/plot4.png")
Sys.setlocale("LC_ALL", "US")
par(mfrow = c(2,2))

#plot1
plot(data$datetime, data$Global_active_power, xlab = NA, ylab = "Global active power", type = "n")
lines(data$datetime, data$Global_active_power, lty = 1)

#plot2
plot(data$datetime, data$Voltage, xlab = "datetime", ylab = "Voltage", type = "n")
lines(data$datetime, data$Voltage, lty = 1)

#plot3
plot(data$datetime, data$Sub_metering_1, type = "n", xlab = NA, ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_1, col = "black")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot4
plot(data$datetime, data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "n")
lines(data$datetime, data$Global_reactive_power, lty = 1)

dev.off()
