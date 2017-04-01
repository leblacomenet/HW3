setwd("/Users/sebastienpenet/Documents/ESSEC/Forecasting/HW3-master")
library(forecast)

# LOAD

gas <- na.omit(read.csv('data/gas.csv'))
temp <- na.omit(read.csv('data/temp.csv'))
google <- na.omit(read.csv('data/google.csv'))

temp$date <- lapply(temp$date, function(x) { as.Date(format(as.Date(x), '%Y-%m-01')) })
gas$date <- lapply(gas$date, function(x) { as.Date(format(as.Date(x), '%Y-%m-01')) })
google$date <- lapply(google$date, function(x) { as.Date(format(as.Date(x), '%Y-%m-01')) })

gasc <- ts(gas$gas_cons[1:510], frequency=12)
gaslc <- ts(gas$log_gas_cons[1:510], frequency=12)
plot(gasc)
plot(gaslc)

gasc_d <- stl(gasc, t.window=12, s.window="periodic")
gasc_d_fit <- forecast(gasc_d, h=12)
plot(gasc_d_fit)

gaslc_d <- stl(gaslc, t.window=12, s.window="periodic")
gaslc_d_fit <- forecast(gaslc_d, h=12)
plot(gaslc_d_fit)

# todo compare fits, compute key stats

