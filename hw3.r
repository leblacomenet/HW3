
# HOMEWORK 3 - FORECASTING MODELS

# Environment
library(forecast)

# Data
gas <- na.omit(read_csv("data/gas.csv", col_types = cols(date = col_date(format = "%Y-%m-%d"))))
temp <- read_csv("data/temp.csv", col_types = cols(date = col_date(format = "%Y-%m-%d")))
google <- read_csv("data/google.csv", col_types = cols(date = col_date(format = "%Y-%m-%d")))

summary(gas)
summary(temp)
summary(google)

# Create and plot Time-Series Objects
gasc <- ts(gas$gas_cons[1:510], frequency=12)
gaslc <- ts(gas$log_gas_cons[1:510], frequency=12)
plot(gasc)
plot(gaslc)

# Forecast after seasonal decomposition

# Consumption
gasc_d <- stl(gasc, t.window=12, s.window="periodic")
gasc_d_fit <- forecast(gasc_d, h=12)
plot(gasc_d_fit)

# Log consumption
gaslc_d <- stl(gaslc, t.window=12, s.window="periodic")
gaslc_d_fit <- forecast(gaslc_d, h=12)
plot(gaslc_d_fit)

# todo compare fits, compute key stats

