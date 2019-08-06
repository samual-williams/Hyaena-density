mClosedD1 <- readRDS(file = "mClosedD1.rds")
mClosedD2 <- readRDS(file = "mClosedD2.rds")
mClosedD3 <- readRDS(file = "mClosedD3.rds")
mClosedD4 <- readRDS(file = "mClosedD4.rds")
mClosedD5 <- readRDS(file = "mClosedD5.rds")
mClosedD6 <- readRDS(file = "mClosedD6.rds")
mClosedD7 <- readRDS(file = "mClosedD7.rds")

### MODEL SELECTION
aic.mClosedD <-  AIC(mClosedD1, mClosedD2, mClosedD3, mClosedD4, mClosedD5, mClosedD6, mClosedD7)
aic.mClosedD
saveRDS(aic.mClosedD, file = "aic.mClosedD.rds")