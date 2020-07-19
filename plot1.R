#clean data
a<- read.table('household_power_consumption.txt', header= TRUE, sep=';', na.strings='?', 
colClasses = c('character','character', 'numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

a$Date<- as.Date(a$Date,"%d/%m/%Y")
a<- subset(a,Date>= as.Date('2007-2-1')& Date<= as.Date('2007-2-2'))

#to remove any incomplete data parts
a<-a[complete.cases(a),]

dateTimevector<- paste(a$Date,a$Time)
dateTimevector<- setNames(dateTimevector,"DateTime")

a<- a[ ,!(names(a)%in% c('Date','Time'))]
a<- cbind(dateTimevector,a)

a$dateTimevector<- as.POSIXct(dateTimevector)

#plot 1 for histogram
hist(a$Global_active_power, main="Global Active Power",xlab='Global Active Power (kilowatts)', col='red')
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()

