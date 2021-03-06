setwd("~/Desktop/Data_science/ExData_Plotting1")
library(readr)
power <- read_delim("household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE)
power$datetime <- as.POSIXct(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, "%d/%m/%Y")

library(lubridate)
time1 <- as.POSIXct("2007-02-01 00:00:00")
time2 <- as.POSIXct("2007-02-02 23:59:00")
int <- interval(time1, time2)
feb <- power[power$datetime %within% int,]

#Plot 3
plot(Sub_metering_1~datetime, data = feb, ylab = "Energy sub metering", type = "l", xlab = "")
points(Sub_metering_2~datetime, data = feb, col = "red", type = "l")
points(Sub_metering_3~datetime, data = feb, col = "blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)
