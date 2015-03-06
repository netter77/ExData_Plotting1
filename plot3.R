{
  # This script makes a file in png format from a txt csv data file
  # You will need to download the file https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
  # You need to unzipp this file in your current working directory with the name household_power_consumption.txt
  # Author: igonzalvez@gmail.com - March 2015
  library(dplyr)
  
  Sys.setlocale("LC_TIME", "English")
  datos <- read.csv("./household_power_consumption.txt",  sep= ";",stringsAsFactors = FALSE)
  
  # Date: Date in format dd/mm/yyyy
  # Time: time in format hh:mm:ss
  # Global_active_power: household global minute-averaged active power (in kilowatt)
  # Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
  # Voltage: minute-averaged voltage (in volt)
  # Global_intensity: household global minute-averaged current intensity (in ampere)
  # Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
  # Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
  # Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
  
 datos$Date = as.Date(datos$Date, "%d/%m/%Y")
  datos <- mutate(datos, fecha_completa=paste(datos$Date,datos$Time))
  datos$fecha_completa = strptime(datos$fecha_completa, "%Y-%m-%d %H:%M:%S")

 # Create a new subset with the period to study
 datos_feb_1_2 <- datos[(datos$Date=="2007-02-01" | datos$Date=="2007-02-02"), ]
  
 
 print("Generating the plot3.png file .....")
 png(file="./plot3.png", width = 480, height = 480, units = "px") # open file png
 
 
# Coordinates definition
x <- datos_feb_1_2$fecha_completa
y <- datos_feb_1_2$Sub_metering_1
w <- datos_feb_1_2$Sub_metering_2
z <- datos_feb_1_2$Sub_metering_3
 
par(pch=".", mar=c(3,4,4,2))
plot(x,y, ylab="Energy sub metering",  xlab="")
 
legend("topright", border = "black", lty=1, xjust=0,  col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
lines(x,y)
 
lines(x,w, col="red")
 
lines(x,z, col="blue")
dev.off() ## close de png file 

print("plot3.png file created succesfully in your currrent working directory.")

}
  