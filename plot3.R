# This script creates the 3rd plot in the assignment.
# It expects extracted dataset file to be in the same directory. Also, working dir 
# needs to be set to "Source file location"

# read the dataset into R
dataset <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?', stringsAsFactors = FALSE)
# converts values in 'Date' column to Date instead of 'character':
dataset$Date = as.Date(dataset$Date, "%d/%m/%Y")
# subsetting original dataset into dataset containing specific dates:
subset.dataset <- dataset[dataset$Date == '2007-02-01' | dataset$Date == '2007-02-02',]
# create a new 'DateTime column:
subset.dataset$DateTime <- paste(subset.dataset$Date, subset.dataset$Time)
# convert values in that column to time objects:
subset.dataset$DateTime <- as.POSIXct(subset.dataset$DateTime)

# select png device:
png(filename = "plot3.png", width = 480, height = 480, units = "px")
# plot the lines
plot(subset.dataset$DateTime,subset.dataset$Sub_metering_1, 
     xlab='', ylab='Energy sub metering', type='l', lwd=1)
lines(subset.dataset$DateTime, subset.dataset$Sub_metering_2, col='red')
lines(subset.dataset$DateTime, subset.dataset$Sub_metering_3, col='blue')
# add a legend in the top right corner
legend('topright', 
       legend=c('Sub_metering_1', "Sub_metering_2", "Sub_metering_3"), 
       lwd=1, col = c('black', 'red', 'blue'))
       
# close the device:
dev.off()
# remove original and derived datasets so they don't use up the memory
rm('dataset')
rm(subset.dataset)