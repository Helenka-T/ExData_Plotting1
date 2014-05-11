headers <- read.table("C:/Users/Elena/Desktop/household.txt", nrows = 1, header=T, sep=";")
data <- read.table("C:/Users/Elena/Desktop/household.txt", sep = ";", na.strings = "?", skip = 21997 + 1440 * 31, nrows = 2880, col.names=names(headers))


data$datetime <- paste(data$Date, data$Time, sep = " ")
data$datetime <-  as.POSIXct(strptime(data$datetime, "%d/%m/%Y %H:%M:%S"))



png("C:/Users/Elena/Desktop/plot2.png")
Sys.setlocale("LC_ALL", "US")
plot(data$datetime, data$Global_active_power, xlab = NA, ylab = "Global active power(kilowatts)", type = "n")
lines(data$datetime, data$Global_active_power, lty = 1)
dev.off()

