# plot 1
# setting my work directory
setwd("ExData_Plotting1/")

#filter the data into the dates required
# define the name of the data in zip
zipfile="household_power_consumption.zip" 
# define the name of data
file="household_power_consumption.txt"
# read the data direct of hte ZIP file
data <- read.csv(unz(zipfile, file), sep=";", stringsAsFactors=FALSE)
# merge the date and time
data$Date <- paste(data$Date, data$Time)
#convert the date format
data$Date=strptime(data$Date, "%d/%m/%Y %H:%M:%S")
# we will use data from the specific  date
data_fil <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-03")
#define the required columns
numcols <- names(data_fil)[3:length(names(data))]
#converting the columns to numbers
data_fil[numcols] <- lapply(data_fil[numcols], as.numeric)
# choosing the device with the specific features
png('plot1.png', width=480, height=480, units="px", bg = "transparent")
#plotting 
hist(data_fil$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power(Kilowatts)")
dev.off()
