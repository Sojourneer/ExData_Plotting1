D <- read.table("household_power_consumption.txt",sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),header=TRUE,na.strings=c("?"))
D$Time <- strptime(paste(D$Date,D$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
D$Date <- as.Date(D$Date,format="%d/%m/%Y")

D2 <- D[D$Date %in% as.Date(c("2007-02-01","2007-02-02")),]

# Plot the data directly to the PNG file
png(width=480,height=480,"plot3.png")

plot(D2$Time, D2$Sub_metering_1,type="l",ylab="Energy sub metering", xlab="", col="black")
lines(D2$Time, D2$Sub_metering_2, col="red")
lines(D2$Time, D2$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,col=c("black","red","blue"))

dev.off()
