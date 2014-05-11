# Project 1

# Initializing
# please move into the folder in which you unzipped the dataset (setwd())
setwd('C://Users//Tijl//Documents//Github//edaCoursera')
dt=read.csv('household_power_consumption.txt',header=T, sep=';') # read the textfile which is formatted as a csv
dt$Datetime = paste(as.character(dt[,1]) , dt[,2])  # merge date and time into a single column (all string variables)
dt[,1]=as.Date(dt$Date,'%d/%m/%Y') # convert the Date column's datatype from string to date 
dt = subset(dt, Date == '2007-02-01' | Date == '2007-02-02') #select only the two required days
dt[,3] = as.numeric(as.character(dt[,3])) # convert the Global Active Power's datatype from text (interpreted as factors, hence the as.character) to numbers

#plot 1
png('plot1.png',width=480,height=480)
hist(dt[,3],col='red',xlab='Global Active Power (kilowatts)', ylab='Frequency',main='Global Active Power')
dev.off()