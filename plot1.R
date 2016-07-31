#read data, and select data from relevant dates
mydata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
mydata <- mydata[(mydata$Date == "1/2/2007") | (mydata$Date == "2/2/2007") ,]

png(filename = "plot1.png") #open graphics device

#create a histogram and send to file
hist(as.numeric(as.character(mydata$Global_active_power)), #data used for histogram
     main = "Global Active Power",                         #graph title
     xlab = "Global Active Power (kilowatts)",             #x-axis label
     col = "red")                                          #red bars

dev.off() #close file device