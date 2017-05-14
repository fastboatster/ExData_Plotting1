# This script creates the first plot in the assignment.
# It expects extracted dataset file to be in the same directory. Also, working dir 
# needs to be set to "Source file location"

# read the dataset into R
dataset <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?', stringsAsFactors = FALSE)
# converts values in 'Date' column to Date instead of 'character':
dataset$Date = as.Date(dataset$Date, "%d/%m/%Y")
# subsetting original dataset into dataset containing specific dates:
subset.dataset <- dataset[dataset$Date == '2007-02-01' | dataset$Date == '2007-02-02',]
# select png device:
png(filename = "plot1.png", width = 480, height = 480, units = "px")
# plot histogram of global active power
with(subset.dataset, 
     hist(Global_active_power, 
          col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)'))
# close the device:
dev.off()
# remove original and derived datasets so they don't use up the memory
rm('dataset')
rm(subset.dataset)