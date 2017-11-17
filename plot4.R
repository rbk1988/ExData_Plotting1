#Read the data into R.
power_data<-read.table("household_power_consumption.txt",sep=";", header = TRUE, na.strings = "?",stringsAsFactors = FALSE,dec=".")

#Select only those records that are required.
data1<-power_data[power_data$Date %in% c("1/2/2007","2/2/2007"),]

#Combine date and time values
dateTime<-strptime(paste(data1$Date,data1$Time,sep = " "),"%d/%m/%Y %H:%M:%S")

#Open the png grahic file device
png(file="plot4.png", width=480, height=480)

#4 plots. 2 rows.2 columns.
par(mfrow = c(2, 2))

#Plot 1
plot(x=dateTime,y=data1$Global_active_power,type="l",xlab = "",ylab = "Global Active Power")

#Plot 2
plot(x=dateTime,y=data1$Voltage,type="l",xlab="datetime",ylab="Voltage")

#Plot 3
plot(x=dateTime,y=data1$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering",main="")
points(x=dateTime,y=data1$Sub_metering_1,col="black",type="l")
points(x=dateTime,y=data1$Sub_metering_2,col="red",type="l")
points(x=dateTime,y=data1$Sub_metering_3,col="blue",type="l")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Plot 4.
plot(x=dateTime,y=data1$Global_reactive_power,type = "l",xlab="datetime",ylab="Global_reactive_power")

#Turn off the png graphic device.
dev.off()