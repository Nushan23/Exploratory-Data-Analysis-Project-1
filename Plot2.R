power_data <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power_data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
           "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower_data <- subset(power_data,power_data$Date=="1/2/2007" | power_data$Date =="2/2/2007")

subpower_data$Date <- as.Date(subpower_data$Date, format="%d/%m/%Y")
subpower_data$Time <- strptime(subpower_data$Time, format="%H:%M:%S")
subpower_data[1:1440,"Time"] <- format(subpower_data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower_data[1441:2880,"Time"] <- format(subpower_data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(subpower_data$Time,as.numeric(as.character(subpower_data$Global_active_power)),type="1",xlab=""
      ,ylab="Global Active Power (kilowatts)") 
dev.off()