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
# save the dataframe to sue in to plot
save(data_fil,file="data_fil.Rda")





