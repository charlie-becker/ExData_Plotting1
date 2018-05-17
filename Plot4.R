d <- read.table("/Users/charlesbecker/Downloads/household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
d$dt <- paste(d$Date,d$Time)
d$t <- strptime(d$dt, format = "%d/%m/%Y %H:%M:%S")

dat <- subset(d, d$Date == "1/2/2007" | d$Date == "2/2/2007")

par(mfrow = c(2,2))

plot(dat$t,dat$Global_active_power, type = 'l',
     ylab = "Global Active Power (Kilowatts)",
     xlab = "",cex = .2)
plot(dat$t,dat$Voltage, type = 'l',
     ylab = "Voltage",
     xlab = "datetime")
plot(dat$t, dat$Sub_metering_1, type = 'l',
     xlab = "",
     ylab = "Energy Sub Metering")
lines(dat$t, dat$Sub_metering_2, col = "red")
lines(dat$t, dat$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"), lty = 1, cex = .5, bty = "n")
plot(dat$t,dat$Global_reactive_power, type = 'l',
     ylab = "Globael_reactive_power",
     xlab = "datetime")

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()