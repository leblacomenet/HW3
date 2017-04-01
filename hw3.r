setwd("/Users/sebastienpenet/Documents/ESSEC/Forecasting/HW3-master")
library(forecast)

# LOAD

gas <- na.omit(read.csv('data/gas.csv'))
temp <- na.omit(read.csv('data/temp.csv'))
google <- na.omit(read.csv('data/google.csv'))

temp$date <- lapply(temp$date, function(x) { as.Date(format(as.Date(x), '%Y-%m-01')) })
gas$date <- lapply(gas$date, function(x) { as.Date(format(as.Date(x), '%Y-%m-01')) })
google$date <- lapply(google$date, function(x) { as.Date(format(as.Date(x), '%Y-%m-01')) })

gasc <- ts(gas$gas_cons, frequency=12)
plot(gasc)

# This data is highly seasonal, let's remove the seasonality
gasc_d <- decompose(gasc)
gasc_adj <- gasc - gasc_d$seasonal
plot(gasc_adj, type="l")
plot(gasc_d$seasonal)

gaslc <- ts(gas$log_gas_cons, frequency=12)
gaslc_d <- decompose(gaslc)
gaslc_adj <- gaslc - gaslc_d$seasonal
plot(gaslc_adj, type="l")
plot(gaslc_d$seasonal)

gasc_stl <- stl(gasc, s.window="periodic")
summary(gasc_stl)
gasc_stl_adj <- gasc - gasc_stl$time.series[,1]
plot(gasc_stl_adj, type="l")
acf(gasc_stl_adj)
