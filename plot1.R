#Read data file into R
power_data<-read.table("household_power_consumption.txt",sep=";", header = TRUE, na.strings = "?",stringsAsFactors = FALSE,dec=".")# ';' is the file delimiter.'?' is used to represent 'NA' values.We want strings to read as strrings and not factors.

#select only the required records. That is for the dates "1/2/2007" and "2/2/2007".
data<-power_data[power_data$Date %in% c("1/2/2007","2/2/2007"),]

#Open the png grahic device to plot
png(file="plot1.png")

# Plot the histogram
hist(data$Global_active_power,xlab="Global Active Power(kilowatts)",ylab="Frequency",col="red",main="Global Active Power")

# Turn grahic device off.
dev.off()