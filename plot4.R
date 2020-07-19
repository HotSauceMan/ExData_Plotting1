par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(a, {
  plot(Global_active_power~dateTimevector, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~dateTimevector, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~dateTimevector, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~dateTimevector,col='Red')
  lines(Sub_metering_3~dateTimevector,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~dateTimevector, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.copy(png,file='plot4.png',height=480, width=480)
dev.off()
