rm(list = ls())
library(randomForest)

main_data.train = read.csv("data/fraud_train.noNA.csv", stringsAsFactors = FALSE)

#convert class label menjadi kategori
main_data.train$flag_transaksi_fraud = as.factor(main_data.train$flag_transaksi_fraud)

#membuat model sekaligus menghitung ranking feature dengan menggunakan opsi importance=TRUE
model = randomForest(flag_transaksi_fraud ~ ., data=main_data.train, importance=TRUE, proximity=TRUE)

#convert data ranking feature menjadi data frame
main_data.importance = as.data.frame(model$importance)

#sorting ranking feature berdasarkan MeanDecreaseAccuracy dari nilai terbesar sampai terkecil
main_data.importance = main_data.importance[order(-main_data.importance$MeanDecreaseAccuracy),]
print(main_data.importance)

#sorting ranking feature berdasarkan MeanDecreaseGini dari nilai terbesar sampai terkecil
main_data.importance = main_data.importance[order(-main_data.importance$MeanDecreaseGini),]
print(main_data.importance)