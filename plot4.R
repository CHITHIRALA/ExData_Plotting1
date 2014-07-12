plot4 <- function()
{
  
  fname <- "household_power_consumption.txt"
  classes <- c(rep("character",2),rep("numeric",7))
  
  #read the input file
  fd <- read.csv(fname,header = TRUE, sep=";",colClasses= classes,na.strings="?" )
  
  #Take data for only Feb 1st 2007 and Feb 2nd 2007 
  fds <- subset(fd, Date %in% c("1/2/2007", "2/2/2007"))
  
  #Create a new field datetime by combining data and time fields
  fds$datetime <- strptime(paste(fds[,1],fds[,2]),format="%d/%m/%Y %H:%M:%S")
  
  
  #plot4
  png(filename = "plot4.png",width = 480, height = 480) # open the png device
  par(mfrow=c(2,2))  # 2 by 2 grid
  with(fds,
      {plot(datetime,Global_active_power, type="l",xlab="",ylab="Global Active Power")
       plot(datetime,Voltage, type="l",xlab="",ylab="Voltage") 
       plot(datetime,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
       lines(datetime,Sub_metering_1,col="black")
       lines(datetime,Sub_metering_2,col="blue")
       lines(datetime,Sub_metering_3,col="red")
       legend("topright",pch="",bty="n",lty = c(1, 1, 1),col = c( "black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
       
       
       plot(datetime,Global_reactive_power, type="l",xlab="",ylab="Global Reactive Power" ) 
      }
       )
  dev.off() #turn off device
  
}
