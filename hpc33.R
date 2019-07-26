readRDS(file = "mOpeng01.rds")
readRDS(file = "mOpeng02.rds")
readRDS(file = "mOpeng03.rds")
readRDS(file = "mOpeng04.rds")
readRDS(file = "mOpeng05.rds")
readRDS(file = "mOpeng06.rds")
readRDS(file = "mOpeng07.rds")
readRDS(file = "mOpeng08.rds")

### MODEL SELECTION
aic.mOpeng0 <-  AIC(mOpeng01, mOpeng02, mOpeng03, mOpeng04, mOpeng05, mOpeng06, mOpeng07, mOpeng08)

saveRDS(aic.mOpeng0, file = "aic.mOpeng0.rds")