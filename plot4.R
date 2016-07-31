#read data that will be used
mydata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
mydata <- mydata[(mydata$Date == "1/2/2007") | (mydata$Date == "2/2/2007") ,]

datetime <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

y1 <- as.numeric(as.character(mydata$Global_active_power)) #y-coord. of top left graph

y2 <- as.numeric(as.character(mydata$Voltage)) #y-coord. of top-right graph

#sub1, sub2, sub3 make up the y-coordinates of the bottom left graph
sub1 <- as.numeric(as.character(mydata$Sub_metering_1))
sub2 <- as.numeric(as.character(mydata$Sub_metering_2))
sub3 <- as.numeric(as.character(mydata$Sub_metering_3))

y3 <- as.numeric(as.character(mydata$Global_reactive_power)) #y-coord. of bottom right graph

png(filename = "plot4.png") #open graphics device

par(mfrow = c(2,2))

#make the first graph (top left)
plot(datetime,y1,                                 #make scatterplot
     type ="l",                                   #format as a line graph
     xlab = '',                                   #no label on x-axis
     ylab = "Global Active Power")                #set y-axis label


#make the second graph (top right)
plot(datetime,y2,                                 #make scatterplot
     type ="l",                                   #format as a line graph
     ylab = "Voltage")                            #set y-axis label

#make the third graph (bottom left)
plot(datetime,sub1,                               #initialize scatterplot and plot sub1
     type = "l",                                  #format as line graph
     xlab = '', ylab = "Energy sub metering")     #set axes labels
points(x_data, sub2, type="l", col="red")         #plot sub2, setting color to red
points(x_data, sub3, type="l", col="blue")        #plot sub3, setting color to blue
#make legend for third graph
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1, bty = "n", col = c("black", "red", "blue"))

#make the fourth graph (bottom right)
plot(datetime,y3,                                 #make scatterplot
     type ="l",                                   #format as a line graph
     ylab ="Global_reactive_power"  )             #y-axis label

dev.off() #close file device