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

png(file="Plot3.png")
with(data, plot(time,Sub_metering_1, type = 's',ylab = 'Energy sub metering', xlab = 'Time'))
with(data,points(time,Sub_metering_2, type = 's',col = 'red'))
with(data,points(time,Sub_metering_3, type = 's',col = 'blue'))
legend('topright',pch=1,col=c('black','red','blue'),legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()
