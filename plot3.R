setwd("\\project1")

EPC <- read.csv("household_power_consumption.txt",
                header=T, sep=';', na.strings="?", 
                nrows=2075259, check.names=F, 
                stringsAsFactors=F, comment.char="",
                quote='\"')
EPC$Date <- as.Date(EPC$Date, format="%d/%m/%Y")

data <- subset(EPC, subset=( (Date <= "2007-02-02") & (Date >= "2007-02-01")))
rm(EPC)

data$mixeddata <- as.POSIXct(paste(data$Date,data$Time))
with(data, {
        plot(Sub_metering_1~mixeddata, type="l", 
        ylab="Global Active Power (kilowatts)", 
        xlab="")
        lines(Sub_metering_2~mixeddata,col='Red')
        lines(Sub_metering_3~mixeddata,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png" ) ## Copy my plot to a PNG file
dev.off() ## closing the PNG device!
