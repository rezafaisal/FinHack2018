rm(list = ls())
library(randomForest)
library(caret)
library(ROCR)

main_data.train = read.csv("data/fraud_train.noNA.cleaning.csv", stringsAsFactors = FALSE)
main_data.train$flag_transaksi_fraud = as.factor(main_data.train$flag_transaksi_fraud)
#main_data.train = main_data.train[, c(-21, -22, -23)]

data_train = main_data.train
levels(data_train$flag_transaksi_fraud) <- make.names(c(0, 1))

# down-sampling/undersampling
ctrl <- trainControl(method = "cv",
                     number = 5,
                     verboseIter = T,
                     classProbs = T,
                     sampling = "down",
                     summaryFunction = twoClassSummary,
                     savePredictions = T)

set.seed(5627)
down_inside = caret::train(flag_transaksi_fraud ~ ., data = data_train, method = "rf", trControl = ctrl, verbose = T, metric = "ROC")
print(down_inside)

#hasil down_inside
#mtry ROC Sens Spec
#2 0.8627221 0.8953227 0.6417582
#12 0.8759569 0.8276226 0.7747253
#23 0.8737852 0.8168152 0.7802198

# up-sampling/oversampling
ctrl$sampling <- "up"
set.seed(5627)
up_inside = caret::train(flag_transaksi_fraud ~ ., data = data_train, method = "rf", trControl = ctrl, verbose = T, metric = "ROC")
print(up_inside)

#hasil up_inside
#mtry ROC Sens Spec
#2 0.8651740 0.9601898 0.4725275
#12 0.8867366 0.9809032 0.4296703
#23 0.8699604 0.9703953 0.4307692

# oversampling with ROSE
ctrl$sampling <- "rose"
set.seed(5627)
rose_inside = caret::train(flag_transaksi_fraud ~ ., data = data_train, method = "rf", trControl = ctrl, verbose = T, metric = "ROC")
print(rose_inside)

#hasil rose_inside
#mtry ROC Sens Spec
#2 0.7519298 0.9824200 0.19780220
#12 0.6960435 0.9913099 0.07582418
#23 0.6357390 0.9918151 0.06923077

# oversampling with SMOTE
ctrl$sampling <- "smote"
set.seed(5627)
smote_inside = caret::train(flag_transaksi_fraud ~ ., data = data_train, method = "rf", trControl = ctrl, verbose = T, metric = "ROC")
print(smote_inside)

#hasil smote_inside
#mtry ROC Sens Spec
#2 0.8589768 0.9481648 0.5054945
#12 0.8787502 0.9129022 0.6351648
#23 0.8743854 0.8994646 0.6417582

# original / without sampling
ctrl <- trainControl(method = "cv",
                     number = 5,
                     verboseIter = T,
                     classProbs = T,
                     summaryFunction = twoClassSummary,
                     savePredictions = T)
set.seed(5627)
orig_fit = caret::train(flag_transaksi_fraud ~ ., data = data_train, method = "rf", trControl = ctrl, verbose = T, metric = "ROC")
print(orig_fit)

#hasil original tanpa sampling
#mtry ROC Sens Spec
#2 0.8712548 0.9893906 0.2868132
#12 0.8917839 0.9873698 0.4241758
#23 0.8881371 0.9836314 0.4384615