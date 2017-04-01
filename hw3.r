setwd("/Users/sebastienpenet/Documents/ESSEC/Forecasting/HW3-master")

# LOAD

gas = na.omit(read.csv('data/gas.csv'))
temp = na.omit(read.csv('data/temp.csv'))
google = na.omit(read.csv('data/google.csv'))

temp$date <- lapply(temp$date, function(x) { as.Date(format(as.Date(x), '%Y-%m-01')) })
gas$date <- lapply(gas$date, function(x) { as.Date(format(as.Date(x), '%Y-%m-01')) })
google$date <- lapply(google$date, function(x) { as.Date(format(as.Date(x), '%Y-%m-01')) })
