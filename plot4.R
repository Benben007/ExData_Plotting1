plot4<-function (){
  setwd("C:/Users/Bernard/desktop/coursera2/Course 4_Exploratory data analysis/ProgrammingAssignement1")
  aa <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")
  aa$DateTime = paste(aa$Date, aa$Time)
  aa$DateTime = as.POSIXlt(aa$DateTime,format="%d/%m/%Y %H:%M:%S")
  aa$Date=  NULL
  aa$Time= NULL
  sub<-subset(aa,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))
  
  png("plot4.png",width=480,height=480)
  
  par(mfrow=c(2,2))
  
  plot(sub$DateTime,sub$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  
  plot(sub$DateTime,sub$Voltage,type="l",xlab="datetime",ylab="Voltage")
  
  plot(sub$DateTime,sub$Sub_metering_1,type="l", col="black",xlab="",ylab="Energy sub metering")
  lines(sub$DateTime,sub$Sub_metering_2,col="red")
  lines(sub$DateTime,sub$Sub_metering_3,col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2,cex=0.7)
  
  plot(sub$DateTime,sub$Global_reactive_power,type="l",xlab="datetime",ylab="Voltage")
  
  dev.off()
  
}