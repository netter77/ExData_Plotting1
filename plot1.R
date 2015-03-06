{
  # This script makes a file in png format from a txt csv data file
  # You will need to download the file https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
  # You need to unzipp this file in your current working directory with the name household_power_consumption.txt
  # Author: igonzalvez@gmail.com - March 2015
  
  # Space required:  2,075,259 rows and 9 columns so we need with 8 bytes/num
  #                  142,5 MB so we need doble; at least 300 MB free of RAM to load data
  # 

  # Remember: You need to have the file with data set uncompressed 
  # "household_power_consumption.txt" in your working directory to load data.
  
  library(dplyr)
 
  
Sys.setlocale("LC_TIME", "English")
datos <- read.csv("./household_power_consumption.txt",  sep= ";",stringsAsFactors = FALSE, na.strings="?")

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

datos$Global_active_power = as.numeric(datos$Global_active_power)
# Create a new subset with the period to study
datos_feb_1_2 <- datos[(datos$Date=="2007-02-01" | datos$Date=="2007-02-02"), ]



print("Generating the plot1.png file .....")
png(file="./plot1.png", width = 480, height = 480, units = "px") # open file png

hist(datos_feb_1_2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", breaks= 12)
dev.off() ## close de png file 

print("plot1.png file created in your currrent working directory.")

}