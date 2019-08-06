mOpenD1 <- readRDS(file = "mOpenD1.rds")
mOpenD2 <- readRDS(file = "mOpenD2.rds")
mOpenD3 <- readRDS(file = "mOpenD3.rds")
mOpenD4 <- readRDS(file = "mOpenD4.rds")
mOpenD5 <- readRDS(file = "mOpenD5.rds")
mOpenD6 <- readRDS(file = "mOpenD6.rds")
mOpenD7 <- readRDS(file = "mOpenD7.rds")

### MODEL SELECTION
aic.mOpenD <-  AIC(mOpenD1, mOpenD2, mOpenD3, mOpenD4, mOpenD5, mOpenD6, mOpenD7)
saveRDS(aic.mOpenD, file = "aic.mOpenD.rds")