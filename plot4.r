# Project 1

# Initializing
# please move into the folder in which you unzipped the dataset (setwd())
setwd('C://Users//Tijl//Documents//Github//edaCoursera')
dt=read.csv('household_power_consumption.txt',header=T, sep=';') # read the textfile which is formatted as a csv
dt$Datetime = paste(as.character(dt[,1]) , dt[,2])  # merge date and time into a single column (all string variables)
dt[,1]=as.Date(dt$Date,'%d/%m/%Y') # convert the Date column's datatype from string to date 
dt = subset(dt, Date == '2007-02-01' | Date == '2007-02-02') #select only the two required days
dt[,3] = as.numeric(as.character(dt[,3])) # convert the Global Active Power's datatype from text (interpreted as factors, hence the as.character) to numbers
dt$Sub_metering_1 <- (as.numeric(as.character(dt$Sub_metering_1))) # Convert all Sub_metering to numbers
dt$Sub_metering_2 <- (as.numeric(as.character(dt$Sub_metering_2)))
dt$Sub_metering_3 <- (as.numeric(as.character(dt$Sub_metering_3)))
dt$Voltage <- (as.numeric(as.character(dt$Voltage)))
dt$Global_reactive_power <- (as.numeric(as.character(dt$Global_reactive_power)))
dt$dt <- strptime(dt$Datetime, '%d/%m/%Y %H:%M') # create a datetime object 

#plot 4
par(mfrow=c(2,2), cex=0.75)
plot(dt$dt,dt$Global_active_power,ylab='Global Active Power',xlab='',type='line')
plot(dt$dt,dt$Voltage,ylab='Voltage',xlab='datetime',type='line')
plot(dt$dt,dt$Sub_metering_1,ylab='Energy sub metering',xlab='',type='line')
lines(dt$dt,dt$Sub_metering_2,col='red')
lines(dt$dt,dt$Sub_metering_3,col='blue')
legend("topright",legend=c('Sub_metering_1      ','Sub_metering_2      ','Sub_metering_3      '), col=c('black','red','blue'), bty="n",lty=1,lwd=1.5,xjust=1,y.intersp=0.6)
plot(dt$dt,dt$Global_reactive_power,xlab='datetime',ylab='Global_reactive_power',type='line')
dev.copy(png,'plot4.png',width=480,height=480)
dev.off()