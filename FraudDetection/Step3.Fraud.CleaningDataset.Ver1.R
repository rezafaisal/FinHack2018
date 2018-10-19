# program ini bertujuan untuk menghapus sample-sample class mayoritas yang memiliki kemiripan.
# hasilnya membuat jumlah sample mayoritas berkurang dari 12.215 menjadi 9.923 sample 
# nilai ini mungkin akan berbeda-beda saat dijalankan
# data hasil pengolahan ini akan disimpan ke dalam file fraud_train.noNA.cleaning.csv
# selanjutnya data dari file ini akan digunakan untuk pembuatan model dan testing

rm(list = ls())
library(unbalanced)

main_data.train = read.csv("data/fraud_train.noNA.csv", stringsAsFactors = FALSE)

main_data.train = main_data.train[,c(-1, -21, -22, -23)] #dihapus karena data tidak memiliki arti atau nilai sama
main_data.train$flag_transaksi_fraud = as.factor(main_data.train$flag_transaksi_fraud)

#original 
#     0     1 
# 12215   910

#ubOSS =============================
data_train = ubOSS(main_data.train[,-ncol(main_data.train)], main_data.train[,ncol(main_data.train)])
data_train.uboss = cbind(data_train$X, data_train$Y)
table(data_train$Y)

#ubENN =============================
data_train = ubENN(data_train.uboss[,-ncol(data_train.uboss)], data_train.uboss[,ncol(data_train.uboss)], k=2)
data_train.ubENN = cbind(data_train$X, data_train$Y)
table(data_train$Y)

#ubCNN =============================
data_train = ubCNN(data_train.ubENN[,-ncol(data_train.ubENN)], data_train.ubENN[,ncol(data_train.ubENN)], k=2)
data_train.ubCNN = cbind(data_train$X, data_train$Y)
table(data_train$Y)

#ubNCL =============================
data_train = ubNCL(data_train.ubCNN[,-ncol(data_train.ubCNN)], data_train.ubCNN[,ncol(data_train.ubCNN)], k=4)
data_train.ubNCL = cbind(data_train$X, data_train$Y)
table(data_train$Y)

colnames(data_train.ubNCL)[ncol(data_train.ubNCL)] = "flag_transaksi_fraud"
write.csv(data_train.ubNCL, "data/fraud_train.noNA.cleaning.csv", quote = FALSE, row.names = FALSE)
