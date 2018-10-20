rm(list = ls())
library(forecast)
library(Metrics)

main_data.train = read.csv("data/atm_train.arima.csv", stringsAsFactors = FALSE)
main_data.test = read.csv("data/atm_test.edit.csv", stringsAsFactors = FALSE)
predict_count = 1

data_no_atm = unique(main_data.train$No.ATM)
data_no_atm = data_no_atm[c(1000:1005)]

for(atm_i in data_no_atm){
  data_train = main_data.train[which(main_data.train$No.ATM == atm_i),]
  
  train = data_train[1:(nrow(data_train)-predict_count),]
  valid = data_train[((nrow(data_train)-predict_count)+1):nrow(data_train),]
  
  data_train.ts = ts(train$Withdrawals, frequency =7)
  model = auto.arima(data_train.ts, D=1)
  print(paste(atm_i,"=================================="))
  summary(model)
  
  forecast_result = as.data.frame(forecast(model, h = predict_count))
  print(forecast_result)
  plot(forecast(model, h = predict_count))
  
  mape_result = mape(valid$Withdrawals, forecast_result[,3])
  print(paste(mape_result, valid$Withdrawals, forecast_result[,3]))
}
