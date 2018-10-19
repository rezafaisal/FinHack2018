rm(list = ls())

library(zoo)

main_data.train = read.csv("data/fraud_train.csv", stringsAsFactors = TRUE)
main_data.test = read.csv("data/fraud_test.csv", stringsAsFactors = TRUE)

colSums(is.na(main_data.train))
colSums(is.na(main_data.test))

#mengelola missing data pada dataset train
main_data.train.rata_rata_nilai_transaksi = mean(main_data.train$rata_rata_nilai_transaksi, na.rm = TRUE)
main_data.train.maksimum_nilai_transaksi = mean(main_data.train$maksimum_nilai_transaksi, na.rm = TRUE)
main_data.train.minimum_nilai_transaksi = mean(main_data.train$minimum_nilai_transaksi, na.rm = TRUE)
main_data.train.rata_rata_jumlah_transaksi = mean(main_data.train$rata_rata_jumlah_transaksi, na.rm = TRUE)

main_data.train$rata_rata_nilai_transaksi = na.fill(main_data.train$rata_rata_nilai_transaksi, main_data.train.rata_rata_nilai_transaksi)
main_data.train$maksimum_nilai_transaksi = na.fill(main_data.train$maksimum_nilai_transaksi, main_data.train.maksimum_nilai_transaksi)
main_data.train$minimum_nilai_transaksi = na.fill(main_data.train$minimum_nilai_transaksi, main_data.train.minimum_nilai_transaksi)
main_data.train$rata_rata_jumlah_transaksi = na.fill(main_data.train$rata_rata_jumlah_transaksi, main_data.train.rata_rata_jumlah_transaksi)

colSums(is.na(main_data.train))


#mengelola missing data pada dataset test
main_data.test.rata_rata_nilai_transaksi = mean(main_data.test$rata_rata_nilai_transaksi, na.rm = TRUE)
main_data.test.maksimum_nilai_transaksi = mean(main_data.test$maksimum_nilai_transaksi, na.rm = TRUE)
main_data.test.minimum_nilai_transaksi = mean(main_data.test$minimum_nilai_transaksi, na.rm = TRUE)
main_data.test.rata_rata_jumlah_transaksi = mean(main_data.test$rata_rata_jumlah_transaksi, na.rm = TRUE)

main_data.test$rata_rata_nilai_transaksi = na.fill(main_data.test$rata_rata_nilai_transaksi, main_data.test.rata_rata_nilai_transaksi)
main_data.test$maksimum_nilai_transaksi = na.fill(main_data.test$maksimum_nilai_transaksi, main_data.test.maksimum_nilai_transaksi)
main_data.test$minimum_nilai_transaksi = na.fill(main_data.test$minimum_nilai_transaksi, main_data.test.minimum_nilai_transaksi)
main_data.test$rata_rata_jumlah_transaksi = na.fill(main_data.test$rata_rata_jumlah_transaksi, main_data.test.rata_rata_jumlah_transaksi)

colSums(is.na(main_data.test))


write.csv(main_data.train, "data/fraud_train.noNA.csv", row.names = FALSE, quote = TRUE)
write.csv(main_data.test, "data/fraud_test.noNA.csv", row.names = FALSE, quote = TRUE)
