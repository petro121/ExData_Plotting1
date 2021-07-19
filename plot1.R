plot1 <- function(){
  ## Read all the data
  data1 <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";")
  
  ## Subset data from 2007-02-01 and 2007-02-02
  data <- subset(data1, Date == "1/2/2007" | Date == "2/2/2007")
  
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
  
  ## Plot histogram of global active power for those 2 days
  png("plot1.png", width=480, height=480)
  hist(data$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
  dev.off()
}