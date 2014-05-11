
headers <- read.table("C:/Users/Elena/Desktop/household.txt", nrows = 1, header=T, sep=";")
data <- read.table("C:/Users/Elena/Desktop/household.txt", sep = ";", na.strings = "?", skip = 21997 + 1440 * 31, nrows = 2880, col.names=names(headers))


png("C:/Users/Elena/Desktop/plot1.png")
hist(data$Global_active_power, col = "red",  ylab = "Frequency", xlab = "Global Active Power (kilowatts)")
dev.off()

