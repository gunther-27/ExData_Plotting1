#load library
library(lubridate)


#load file
df <- read.csv('household_power_consumption.txt', sep = ';')

#change format of date
df$Date <- dmy(df$Date)

#get between dates
start_date = '2007-02-01'
end_date = '2007-02-02'

data<-df[df$Date>=start_date & df$Date<=end_date,]
rm(df)

#change to numeric data type
data$Global_active_power <- as.numeric(data$Global_active_power)

#reformat dates
Date <- as.Date(data$Date, format="%d/%,/%Y")
time <- as.POSIXct(paste(Date,data$Time))

# create and save plot as .png
png(file="Plot2.png")
plot(time,data$Global_active_power, type = 's', ylab = 'Global Active Power (kilowatts)')
dev.off()
