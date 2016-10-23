R packages "dplyr" and "tidyr" need to be installed and attached. Before generating the figures, the raw data (Individual household electric power consumption Data Set) was cleaned. The piece of code used to clean the data is included in plot1.R. As such, plot1.R needs to be excuted first before running the other scripts. To run the scripts, keep the scripts and the raw data in the same folder and excute "source()".

Details on the scripts are as below.

##cleaning data
library(dplyr)
library(tidyr)
data <- read.table("./household_power_consumption.txt", header = T) ## read the raw data into a dataframe.

## The raw data has all the elements in one column. They need to be separated into different columns.
## Here, the column names are extracted and separated into individual strings.
columnNames <- colnames(data)
columnNames <- strsplit(as.character(columnNames), ".", fixed = T)
columnNames <- unlist(columnNames)   


## Values in the rest of the dataframe are separated and saved into 9 invididual columns, each in corresponding to the 
## column names sperated from the last step.

clean <- separate(data, "Date.Time.Global_active_power.Global_reactive_power.Voltage.Global_intensity.Sub_metering_1.Sub_metering_2.Sub_metering_3", into = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), sep = ";")

## The mode of the Date column is altered from "character" to "date"
clean <- mutate(clean, Date=as.Date(Date, "%d/%m/%Y"))

## The range of data that is used in this exercise is extracted and is saved as a new dataframe. Meanwhile, the mode of the ##Time column is altered to "date" and the rest of the columns are changed to "numeric" values. 
clean2 <- filter(clean, Date == "2007-02-01")
clean3 <- filter(clean, Date == "2007-02-02")
clean_project <- rbind(clean2, clean3)
clean_project[,3:9] <- sapply(clean_project[, 3:9], as.numeric)
clean_project <- mutate(clean_project, daytime = paste(clean_project$Date, clean_project$Time))
clean_project$daytime <- strptime(clean_project$daytime, "%Y-%m-%d %H:%M:%S")

## The following codes are used to reproduce the required figures in png device.
##plot1
png(file = "plot1.png", width = 480, height = 480, units = "px" )
hist(clean_project$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()

##plot2
png(file = "plot2.png", width = 480, height = 480, units = "px")
with(clean_project, plot(daytime, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (Kilowatts)"))
with(clean_project, lines(daytime, Global_active_power))
dev.off()

##plot3
png(file = "plot3.png", width = 480, height = 480, units = "px")
with(clean_project, plot(daytime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n"))
with(clean_project, lines(daytime, Sub_metering_1, col = "black"))
with(clean_project, lines(daytime, Sub_metering_2, col = "red"))
with(clean_project, lines(daytime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

##plot4
png(file = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
with(clean_project, plot(daytime, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (Kilowatts)", cex.lab=0.7, cex.axis=1))
with(clean_project, lines(daytime, Global_active_power))

with(clean_project, plot(daytime, Voltage, type = "n", xlab = "datetime", ylab = "Voltage", cex.lab=0.7, cex.axis=1))
with(clean_project, lines(daytime, Voltage))

with(clean_project, plot(daytime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n"))
with(clean_project, lines(daytime, Sub_metering_1, col = "black"))
with(clean_project, lines(daytime, Sub_metering_2, col = "red"))
with(clean_project, lines(daytime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex =0.5)

with(clean_project, plot(daytime, Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power", cex.lab=0.7, cex.axis=1))
with(clean_project, lines(daytime, Global_reactive_power))
dev.off()
