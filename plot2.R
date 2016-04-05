
data=read.table('household_power_consumption.txt',sep=';',header=TRUE, na.strings = "?")
data <- data[complete.cases(data),]

datasub <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

plot(Global_active_power~Time, data=datasub, xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png,'plot2.png')
dev.off()