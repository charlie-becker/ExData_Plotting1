d <- read.table("/Users/charlesbecker/Downloads/household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
d$dt <- paste(d$Date,d$Time)
d$t <- strptime(d$dt, format = "%d/%m/%Y %H:%M:%S")

dat <- subset(d, d$Date == "1/2/2007" | d$Date == "2/2/2007")

par(mfrow = c(1,1))

plot(dat$t, dat$Sub_metering_1, type = 'l',
     xlab = "",
     ylab = "Energy Sub Metering")
lines(dat$t, dat$Sub_metering_2, col = "red")
lines(dat$t, dat$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"), lty = 1)

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()