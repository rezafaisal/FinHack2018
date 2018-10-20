rm(list = ls())
library(unbalanced)

main_data.train = read.csv("data/npl_train.csv", stringsAsFactors = FALSE)

main_data.train = cbind(main_data.train[, -15], main_data.train[, 15])
colnames(main_data.train)[ncol(main_data.train)] = "flag_kredit_macet"
main_data.train$flag_kredit_macet = as.factor(main_data.train$flag_kredit_macet)
main_data.train = main_data.train[, c(-1, -9)] #dihapus karena data tidak memiliki arti atau nilai sama

#original 
#     0     1 
# 14134  1359

#ubOSS =============================
data_train = ubOSS(main_data.train[, -ncol(main_data.train)], main_data.train[, ncol(main_data.train)])
data_train.uboss = cbind(data_train$X, data_train$Y)
table(data_train$Y)

#ubENN =============================
data_train = ubENN(data_train.uboss[, - ncol(data_train.uboss)], data_train.uboss[, ncol(data_train.uboss)], k = 2)
data_train.ubENN = cbind(data_train$X, data_train$Y)
table(data_train$Y)

#ubCNN =============================
data_train = ubCNN(data_train.ubENN[, - ncol(data_train.ubENN)], data_train.ubENN[, ncol(data_train.ubENN)], k = 2)
data_train.ubCNN = cbind(data_train$X, data_train$Y)
table(data_train$Y)

#ubNCL =============================
data_train = ubNCL(data_train.ubCNN[, - ncol(data_train.ubCNN)], data_train.ubCNN[, ncol(data_train.ubCNN)], k = 4)
data_train.ubNCL = cbind(data_train$X, data_train$Y)
table(data_train$Y)

colnames(data_train.ubNCL)[ncol(data_train.ubNCL)] = "flag_kredit_macet"
write.csv(data_train.ubNCL, "data/npl_train.cleaned.csv", quote = FALSE, row.names = FALSE)
