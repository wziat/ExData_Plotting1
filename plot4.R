# CLEAN ENVIRONMENT

rm(list = ls())


# DOWNLOAD FILE

download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "quizz_1_raw_file.zip")


# UNZIP AND READ FILE

raw_data <- read.csv(unzip("quizz_1_raw_file.zip"), sep = ";")


# CONVERT DATE TO R FORMAT

raw_data$date2 <- as.Date(raw_data$Date, "%d/%m/%Y")


# SUBSET THE DATA

subset_1 <- raw_data[which(raw_data$date2 == '2007-02-01' | raw_data$date2 == '2007-02-02') , ]

# GENERATE A DATE AND TIME VARIABLE

subset_1$Date_Time <- with(subset_1, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))


# PLOT 4

# SET PLOT ENVIRONMENT

par(mfrow = c(2,2), mar = c(4,4,1,2))

# OPEN PNG FILE

dev.copy(png, file = "plot4.png", width = 480, height = 480)


# PLOT 4.1

with(subset_1, plot(x = Date_Time , y = as.numeric(as.character(Global_active_power)), xlab = "", ylab = "Global Active Power", type = "l"))

# PLOT 4.2

with(subset_1, plot(x = Date_Time , y = as.numeric(as.character(Voltage)), xlab = "datetime", ylab = "Voltage", type = "l"))

# PLOT 4.3

with(subset_1, {
  plot(x = Date_Time , y = as.numeric(as.character(Sub_metering_1)), col = "blue"  , xlab = "", ylab = "Energy sub metering", type = "n")
  lines(x = Date_Time , y = as.numeric(as.character(Sub_metering_1)), col = "black" , xlab = "", ylab = "Energy sub metering", type = "l")
  lines(x = Date_Time , y = as.numeric(as.character(Sub_metering_2)), col = "red"   , xlab = "", ylab = "Energy sub metering", type = "l")
  lines(x = Date_Time , y = as.numeric(as.character(Sub_metering_3)), col = "blue"  , xlab = "", ylab = "Energy sub metering", type = "l")
})
legend("topright", lty = c(1,1,1), col = c("black" , "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75, bty = "n")



# PLOT 4.4

with(subset_1, plot (x = Date_Time, y = as.numeric(as.character(Global_reactive_power)), xlab = "datetime", ylab = "Global_reactive_power", type = "l"))

# CLOSE PNG FILE

dev.off()