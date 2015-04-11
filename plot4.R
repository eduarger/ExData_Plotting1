# plot 4
#R script to filter the data into the dates required

# define the name of the data
zipfile="household_power_consumption.zip" 
file="household_power_consumption.txt"
data <- read.csv(unz(zipfile, file), sep=";", stringsAsFactors=FALSE)
# we will use data from 2007-02-01 to 2007-02-02, we will filter the data
data$Date <- paste(data$Date, data$Time)
data$Date=strptime(data$Date, "%d/%m/%Y %H:%M:%S")
data_fil <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-03")
numcols <- names(data_fil)[3:length(names(data))]
data_fil[numcols] <- lapply(data_fil[numcols], as.numeric)

# choosing the device
png('plot4.png', width=480, height=480, units="px", bg = "transparent")
#select the form of the plots
par(mfcol= c(2,2))

#plotting the first plot

plot(data_fil$Date, data_fil$Global_active_power, col="black", ylab="Global Active Power(Kilowatts)", type = "l", xlab="")

#plot the second
plot(data_fil$Date, data_fil$Sub_metering_1, col="black", main="", ylab="Energy sub metering", type = "l", xlab="")
points(data_fil$Date, data_fil$Sub_metering_2, col="red", type = "l")
points(data_fil$Date, data_fil$Sub_metering_3, col="blue", type = "l")
#adding the legend
legend("topright", names(data_fil)[7:length(names(data_fil))],  horiz=FALSE, col=c("black", "red", "blue"), lty= 1)

# plot the 3 plot
plot(data_fil$Date, data_fil$Voltage, col="black", main="", ylab="Voltage", type = "l", xlab="datetime")


# plot the 4 plot
plot(data_fil$Date, data_fil$Global_reactive_power, col="black", ylab="Global Reactive Power", type = "l", xlab="")


dev.off()

