# plot 1
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
# choosing the device with the specific features
png('plot1.png', width=480, height=480, units="px", bg = "transparent")
#plotting 
hist(data_fil$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power(Kilowatts)")
dev.off()
