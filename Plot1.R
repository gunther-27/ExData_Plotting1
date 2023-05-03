#load library
library(lubridate)
#set directory 
setwd("C:/Users/jegun/OneDrive/Documents/Coursera/04_Data_Exploration/Project1")
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
# create and save plot as .png
png(file="Plot1.png")
hist(data$Global_active_power, col = "red", main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency')
dev.off()