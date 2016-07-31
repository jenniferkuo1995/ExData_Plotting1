#read data, and select data from relevant dates
mydata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
mydata <- mydata[(mydata$Date == "1/2/2007") | (mydata$Date == "2/2/2007") ,]

#make array with x-coordinates of data points
x_data <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#sub1, sub2, sub3 make up the y-coordinates
sub1 <- as.numeric(as.character(mydata$Sub_metering_1))
sub2 <- as.numeric(as.character(mydata$Sub_metering_2))
sub3 <- as.numeric(as.character(mydata$Sub_metering_3))

png(filename = "plot3.png") #open graphics device

plot(x_data,sub1,                               #initialize scatterplot and plot sub1
     type = "l",                                #format as line graph
     xlab = '', ylab = "Energy sub metering")   #set axes labels
points(x_data, sub2, type="l", col="red")       #plot sub2, setting color to red
points(x_data, sub3, type="l", col="blue")      #plot sub3, setting color to blue

#make legend for scatterplot
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1, col = c("black", "red", "blue"))

dev.off() #close file device