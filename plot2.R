##plot2
png(file = "plot2.png", width = 480, height = 480, units = "px")
with(clean_project, plot(daytime, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (Kilowatts)"))
with(clean_project, lines(daytime, Global_active_power))
dev.off()
