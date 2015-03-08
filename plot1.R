# plot 1
# load the filter data frame that was filter with cur_data.R
load("data_fil.Rda")
# choosing the device
png('plot1.png', width=480, height=480, units="px", bg = "transparent")
#plotting 
hist(data_fil$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power(Kilowatts)")
dev.off()
