D <- read.table("household_power_consumption.txt",sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),header=TRUE,na.strings=c("?"))
D$Time <- strptime(paste(D$Date,D$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
D$Date <- as.Date(D$Date,format="%d/%m/%Y")

D2 <- D[D$Date %in% as.Date(c("2007-02-01","2007-02-02")),]

# Plot the data directly to the PNG file
png(width=480,height=480,"plot1.png")
hist(D2$Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
