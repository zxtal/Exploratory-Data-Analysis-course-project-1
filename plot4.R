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
