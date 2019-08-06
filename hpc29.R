library(secr)

load("inputs.RData")

# is magnitude of detection affected by spotteds
mOpeng05 <- secr.fit(cptr_hst, model=g0~SpHyRAI, mask=maskOpen, detectfn=2, CL=TRUE) 
saveRDS(mOpeng05, file = "mOpeng05.rds")