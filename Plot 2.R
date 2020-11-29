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

#Plot 2
plot(Global_active_power~datetime, data = feb, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
