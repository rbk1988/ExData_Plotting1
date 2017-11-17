#Read the data into R.
power_data<-read.table("household_power_consumption.txt",sep=";", header = TRUE, na.strings = "?",stringsAsFactors = FALSE,dec=".")

#Select only the required rows.
data1<-power_data[power_data$Date %in% c("1/2/2007","2/2/2007"),]

#Combine the date and time values to get datetime 
dateTime<-strptime(paste(data1$Date,data1$Time,sep = " "),"%d/%m/%Y %H:%M:%S")

#Open the png grahic file device
png(file="plot3.png")

#Set up the plot
plot(x=dateTime,y=data1$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering",main="")# type="n" makes sure that nothing is plotted on the dvice at this stage. 

#Plot for Sub_metering_1
lines(x=dateTime,y=data1$Sub_metering_1,col="black")

#Plot for Sub_metering_2
lines(x=dateTime,y=data1$Sub_metering_2,col="red")

#Plot for Sub_metering_3
lines(x=dateTime,y=data1$Sub_metering_3,col="blue")

#Legend.
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

#Turn off the png graphic file device.
dev.off()