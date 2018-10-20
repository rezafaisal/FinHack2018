rm(list = ls())
library(caret)

main_data.train = read.csv("data/npl_train.cleaned.csv", stringsAsFactors = FALSE)
main_data.train$flag_kredit_macet = as.factor(main_data.train$flag_kredit_macet)

data_train = main_data.train
levels(data_train$flag_kredit_macet) <- make.names(c(0, 1))


ctrl <- trainControl(method = "cv",
                     number = 5,
                     verboseIter = T,
                     classProbs = T,
                     sampling = "down",
                     summaryFunction = twoClassSummary,
                     savePredictions = T)

print("down ========================================")
set.seed(5627)
down_inside = caret::train(flag_kredit_macet ~ ., data = data_train, method = "rf", trControl = ctrl, verbose = T, metric = "ROC")
print(down_inside)

#hasil down_inside
#mtry ROC Sens Spec
#2 0.8872178 0.7903321 0.8241290
#11 0.8857814 0.7900564 0.8307630
#21 0.8846343 0.7919785 0.8219422

print("up ========================================")
ctrl$sampling <- "up"
set.seed(5627)
up_inside = caret::train(flag_kredit_macet ~ ., data = data_train, method = "rf", trControl = ctrl, verbose = T, metric = "ROC")
print(up_inside)

#hasil up_inside
#mtry ROC Sens Spec
#2 0.8944726 0.9535795 0.4731414
#11 0.8892252 0.9583403 0.4260500
#21 0.8811333 0.9503752 0.4370957

print("rose ========================================")
ctrl$sampling <- "rose"
set.seed(5627)
rose_inside = caret::train(flag_kredit_macet ~ ., data = data_train, method = "rf", trControl = ctrl, verbose = T, metric = "ROC")
print(rose_inside)

#hasil rose_inside
#mtry ROC Sens Spec
#2 0.7496470 0.7565760 0.5150667
#11 0.7045905 0.6699719 0.5555133
#21 0.7257063 0.5538546 0.6492267

print("smote ========================================")
ctrl$sampling <- "smote"
set.seed(5627)
smote_inside = caret::train(flag_kredit_macet ~ ., data = data_train, method = "rf", trControl = ctrl, verbose = T, metric = "ROC")
print(smote_inside)

#hasil smote_inside
#mtry ROC Sens Spec
#2 0.8872079 0.8689798 0.7019617
#11 0.8829924 0.8665085 0.6960848
#21 0.8771509 0.8658672 0.6879938

print("imbalanced ========================================")
ctrl <- trainControl(method = "cv",
                     number = 5,
                     verboseIter = T,
                     classProbs = T,
                     summaryFunction = twoClassSummary,
                     savePredictions = T)
set.seed(5627)
orig_fit = caret::train(flag_kredit_macet ~ ., data = data_train, method = "rf", trControl = ctrl, verbose = T, metric = "ROC")
print(orig_fit)

#hasil original
#mtry ROC Sens Spec
#2 0.8971425 0.9821456 0.2840569
#11 0.8954414 0.9738138 0.3436483
#21 0.8926600 0.9702432 0.3561564