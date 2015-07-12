plot2<-function(){
library(lubridate)

## read, subset, and make data usable for plotting against datetime

plotdata <- read.csv("~/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
plotdata$Date <- strptime(plotdata$Date, "%d/%m/%Y")
## plotdata$DateTime<-strptime(paste(plotdata$Date, plotdata$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")
## plotdata <- plotdata[(plotdata$DateTime>="2007-02-01") & (plotdata$DateTime<="2007-02-02"),]
plotdata <- plotdata[(plotdata$Date>="2007-02-01") & (plotdata$Date<="2007-02-02"),]
plotdata$weekday<-wday(plotdata$Date,label=TRUE)
temp<-paste(as.character(plotdata$Date), plotdata$Time)
plotdata$DateTime<-strptime(temp, format="%Y-%m-%d %H:%M:%S")


## Create png device and plot data. Close device

png(file="plot2.png", width = 480, height = 480)
plot(plotdata$DateTime,plotdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


}