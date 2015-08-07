data<- read.csv("data.txt", sep=";", header=TRUE, dec=".", na.strings="?", stringsAsFactors=F)
d<-data
d$Date <- as.Date( as.character(d$Date), "%d/%m/%Y")

data2<-d[d$Date>= "2007-02-01" & d$Date<= "2007-02-02",]
data3<-within(data2, { timestamp=format(as.POSIXct(paste(data2$Date, data2$Time)), "%d/%m/%Y %H:%M:%S") })

t<-strptime(data3$timestamp, "%d/%m/%Y %H:%M:%S")

data3$timestamp<-t

png(filename="plot1.png")
hist(data3$Global_active_power, col="red", main="Global Active Power", xlab= "Global Active Power (killowats)")
dev.off()