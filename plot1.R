plot1<-function (){
  setwd("C:/Users/Bernard/desktop/coursera2/Course 4_Exploratory data analysis/ProgrammingAssignement1")
  aa <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")
  aa$DateTime = paste(aa$Date, aa$Time)
  aa$DateTime = as.POSIXlt(aa$DateTime,format="%d/%m/%Y %H:%M:%S")
  aa$Date=  NULL
  aa$Time= NULL
  sub<-subset(aa,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))
  
  png("plot1.png",width=480,height=480)
  hist(sub$Global_active_power, xlab="Global Active Power (kilowatts)", main = "Global Active Power", c="red")
  dev.off()
  
}


