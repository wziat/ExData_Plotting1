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


# GENERATE PLOT 1

par(mfrow = c(1,1))

dev.copy(png, file = "plot1.png", width = 480, height = 480)

with(subset_1, hist(as.numeric(as.character(Global_active_power)), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))

dev.off(4)

