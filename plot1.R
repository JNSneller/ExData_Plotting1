plot1<-function(){

  
  ## read and subset data
  
  plotdata <- read.csv("~/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
  plotdata$Date<-strptime(plotdata$Date, "%d/%m/%Y")
  plotdata<-plotdata[(plotdata$Date>="2007-02-01") & (plotdata$Date<="2007-02-02"),]
  
  
  ## Create png device and plot data. Close device
  
  png(file="plot1.png", width = 480, height = 480)
  hist(plotdata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequeuncy", main="Global Active Power")
  dev.off()
  
  
}