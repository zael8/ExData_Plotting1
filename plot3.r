data<- read.csv("data.txt", sep=";", header=TRUE, dec=".", na.strings="?", stringsAsFactors=F)
d<-data
d$Date <- as.Date( as.character(d$Date), "%d/%m/%Y")

data2<-d[d$Date>= "2007-02-01" & d$Date<= "2007-02-02",]
data3<-within(data2, { timestamp=format(as.POSIXct(paste(data2$Date, data2$Time)), "%d/%m/%Y %H:%M:%S") })

t<-strptime(data3$timestamp, "%d/%m/%Y %H:%M:%S")

data3$timestamp<-t

png(filename="plot3.png")
par(mar=c(1,1,1,1))
par(pin=c(5,4))
plot( data3$timestamp,data3$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(data3$timestamp,data3$Sub_metering_2,col="red")
lines(data3$timestamp,data3$Sub_metering_3,col="blue")
legend("topright", 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=2, cex=0.8,y.intersp=1, col=c("black","red","blue"), lty=c(1,1,1))
	   
dev.off()