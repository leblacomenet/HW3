setwd("/Users/sebastienpenet/Documents/ESSEC/Forecasting/HW3-master")

# LOAD

gas = read.csv('data/gas.csv')
temp = read.csv('data/temp.csv')
google = read.csv('data/google.csv')

summary(gas)
gas$date <- as.Date(gas$date)
plot(gas$date, gas$gas_cons, type="l")
plot(gas$date, gas$log_gas_cons, type="l")
