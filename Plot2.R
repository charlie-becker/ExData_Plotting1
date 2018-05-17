d <- read.table("/Users/charlesbecker/Downloads/household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
d$dt <- paste(d$Date,d$Time)
d$t <- strptime(d$dt, format = "%d/%m/%Y %H:%M:%S")

dat <- subset(d, d$Date == "1/2/2007" | d$Date == "2/2/2007")

par(mfrow = c(1,1))

plot(dat$t,dat$Global_active_power, type = 'l',
     ylab = "Global Active Power (Kilowatts)",
     xlab = "")

dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()