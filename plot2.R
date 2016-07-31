#read data, and select data from relevant dates
mydata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
mydata <- mydata[(mydata$Date == "1/2/2007") | (mydata$Date == "2/2/2007") ,]

#make array with x coordinates
x_data <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#make array with y coordinates
y_data <- as.numeric(as.character(mydata$Global_active_power))

png(filename = "plot2.png") #open graphics device

plot(x_data,y_data,                               #make scatterplot
     type ="l",                                   #format as a line graph
     xlab = '',                                   #no label on x-axis
     ylab = "Global Active Power (kilowatts)")    #set y-axis label

dev.off() #close file device