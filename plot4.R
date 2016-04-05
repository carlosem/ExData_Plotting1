
data=read.table('household_power_consumption.txt',sep=';',header=TRUE, na.strings = "?")
data <- data[complete.cases(data),]

datasub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

par(mfrow = c(2,2))
plot(Global_active_power~Time, data=datasub, xlab = "", ylab = "Global Active Power (kilowatts)")

plot(Voltage~Time, data=datasub, xlab = "datetime", ylab = "Voltage")

with(datasub, plot(Time, Sub_metering_1, type="n", ylab = "Energy sub metering"))
with(datasub, points(Time, Sub_metering_2, col = "red"))
with(datasub, points(Time, Sub_metering_3, col = "blue"))
legend("topright", pch = "___", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(Global_reactive_power~Time, data=datasub, xlab = "datetime")

dev.copy(png,'plot4.png')
dev.off()