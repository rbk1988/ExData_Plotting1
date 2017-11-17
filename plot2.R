#Read the data into R
power_data<-read.table("household_power_consumption.txt",sep=";", header = TRUE, na.strings = "?",stringsAsFactors = FALSE,dec=".")

#Select only the required data. that is of the dates "1/2/2007" and "2/2/2007".
data1<-power_data[power_data$Date %in% c("1/2/2007","2/2/2007"),]

#Combine the Date and Time values into a single value
dateTime<-strptime(paste(data1$Date,data1$Time,sep = " "),"%d/%m/%Y %H:%M:%S")

#Start the png grahic device
png(file="plot2.png")

#Make the line plot
plot(x=dateTime,y=data1$Global_active_power, type = "l",xlab = "",ylab="Global Active Power (kilowatts)")# type="l"  to draw line plot.

# Off the graphic device
dev.off()