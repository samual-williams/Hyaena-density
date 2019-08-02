readRDS(file = "mOpenD1.rds")
readRDS(file = "mOpenD2.rds")
readRDS(file = "mOpenD3.rds")
readRDS(file = "mOpenD4.rds")
readRDS(file = "mOpenD5.rds")
readRDS(file = "mOpenD6.rds")
readRDS(file = "mOpenD7.rds")

### MODEL SELECTION
aic.mOpenD <-  AIC(mOpenD1, mOpenD2, mOpenD3, mOpenD4, mOpenD5, mOpenD6, mOpenD7)
saveRDS(aic.mOpenD, file = "aic.mOpenD.rds")