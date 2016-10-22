##plot3
png(file = "plot3.png", width = 480, height = 480, units = "px")
with(clean_project, plot(daytime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n"))
with(clean_project, lines(daytime, Sub_metering_1, col = "black"))
with(clean_project, lines(daytime, Sub_metering_2, col = "red"))
with(clean_project, lines(daytime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()