D <- read.table("household_power_consumption.txt",sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),header=TRUE,na.strings=c("?"))
D$Time <- strptime(paste(D$Date,D$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
D$Date <- as.Date(D$Date,format="%d/%m/%Y")

D2 <- D[D$Date %in% as.Date(c("2007-02-01","2007-02-02")),]

# Plot the data directly to the PNG file
png(width=480,height=480,"plot4.png")

par(mfrow=c(2,2))

# Plot 1
plot(D2$Time, D2$Global_active_power,type="l",ylab="Global Active Power", xlab="", col="black")

# Plot 2
plot(D2$Time, D2$Voltage,type="l",ylab="Voltage", xlab="datetime", col="black")

# Plot 3
plot(D2$Time, D2$Sub_metering_1,type="l",ylab="Energy sub metering", xlab="", col="black")
lines(D2$Time, D2$Sub_metering_2, col="red")
lines(D2$Time, D2$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering1","Sub_metering_2","Sub_metering_3"),lwd=1,col=c("black","red","blue"),bty="n")

# Plot 4
plot(D2$Time, D2$Global_reactive_power,type="l",ylab="Global_reactive_power", xlab="datetime", col="black")


dev.off()
