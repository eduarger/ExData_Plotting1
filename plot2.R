# plot 2
# load the filter data frame that was filter with cur_data.R
load("data_fil.Rda")
# choosing the device
png('plot2.png', width=480, height=480, units="px", bg = "transparent")
#plotting
plot(data_fil$Date, data_fil$Global_active_power, col="black", main="Global Active Power", ylab="Global Active Power(Kilowatts)", type = "l", xlab="")
dev.off()
