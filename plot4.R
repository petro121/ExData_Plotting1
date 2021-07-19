plot4 <- function(){
  ## To be able to work on all NonEnglish systems
  Sys.setlocale("LC_ALL","English")
  
  ## Read all the data
  data1 <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";")
  
  ## Subset data from 2007-02-01 and 2007-02-02
  data <- subset(data1, Date == "1/2/2007" | Date == "2/2/2007")
  
  ## Create column in table with date and time merged together
  FullTimeDate <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  data <- cbind(data, FullTimeDate)
  
  ## Change class of all columns to correct class
  data$Date <- as.Date(data$Date, format="%d/%m/%Y")
  data$Time <- format(data$Time, format="%H:%M:%S")
  data$Global_active_power <- as.numeric(data$Global_active_power)
  data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
  data$Voltage <- as.numeric(data$Voltage)
  data$Global_intensity <- as.numeric(data$Global_intensity)
  data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
  data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
  data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
  
  ## Plot 4 graphs
  png("plot4.png", width=480, height=480)
  par(mfrow=c(2,2))
  with(data, plot(FullTimeDate, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
  with(data, plot(FullTimeDate, Voltage, type = "l", xlab="datetime", ylab="Voltage"))
  with(data, plot(FullTimeDate, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
  lines(data$FullTimeDate, data$Sub_metering_2,type="l", col= "red")
  lines(data$FullTimeDate, data$Sub_metering_3,type="l", col= "blue")
  legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"), bty = "n")
  with(data, plot(FullTimeDate, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
  dev.off()
}