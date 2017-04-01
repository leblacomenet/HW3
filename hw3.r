setwd("/Users/sebastienpenet/Documents/ESSEC/Forecasting/HW3-master")

# LOAD

gas = na.omit(read.csv('data/gas.csv'))
temp = na.omit(read.csv('data/temp.csv'))
google = na.omit(read.csv('data/google.csv'))

summary(gas)
gas$date <- as.Date(gas$date)
plot(gas$date, gas$gas_cons, type="l")
plot(gas$date, gas$log_gas_cons, type="l")
