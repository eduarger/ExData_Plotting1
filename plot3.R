# plot 3
# load the filter data frame that was filter with cur_data.R
load("data_fil.Rda")
# choosing the device
png('plot3.png', width=480, height=480, units="px", bg = "transparent")
#plotting
plot(data_fil$Date, data_fil$Sub_metering_1, col="black", main="", ylab="Energy sub metering", type = "l", xlab="")
points(data_fil$Date, data_fil$Sub_metering_2, col="red", type = "l")
points(data_fil$Date, data_fil$Sub_metering_3, col="blue", type = "l")
#adding the legend
legend("topright", names(data_fil)[7:length(names(data_fil))],  horiz=FALSE, col=c("black", "red", "blue"), lty= 1)
dev.off()

