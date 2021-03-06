plot2 <- function()
{
  fname <- "household_power_consumption.txt"
  classes <- c(rep("character",2),rep("numeric",7))
  
  #read the input file
  fd <- read.csv(fname,header = TRUE, sep=";",colClasses= classes,na.strings="?" )
  
  #Take data for only Feb 1st 2007 and Feb 2nd 2007
  fds <- subset(fd, Date %in% c("1/2/2007", "2/2/2007"))
  
  #Create a new field datetime by combining data and time fields
  fds$datetime <- strptime(paste(fds[,1],fds[,2]),format="%d/%m/%Y %H:%M:%S")
  
  
  #plot2
  png(filename = "plot2.png",width = 480, height = 480)  #open png device
  with(fds, plot(datetime,Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)"))
  dev.off() #Turn off the device
    
}
