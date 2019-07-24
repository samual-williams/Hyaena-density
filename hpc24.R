readRDS(file = "mClosedD1.rds")
readRDS(file = "mClosedD2.rds")
readRDS(file = "mClosedD3.rds")
readRDS(file = "mClosedD4.rds")
readRDS(file = "mClosedD5.rds")
readRDS(file = "mClosedD6.rds")
readRDS(file = "mClosedD7.rds")

### MODEL SELECTION
aic.mClosedD <-  AIC(mClosedD1, mClosedD2, mClosedD3, mClosedD4, mClosedD5, mClosedD6, mClosedD7)

saveRDS(aic.mClosedD, file = "aic.mClosedD.rds")