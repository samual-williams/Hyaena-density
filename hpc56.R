library(secr)

load("inputs.RData")

# is magnitude of detection affected by spotteds
mOpeng05_HN <- secr.fit(cptr_hst, model=g0~SpHyRAI, mask=maskOpen, detectfn=0, CL=FALSE) 
saveRDS(mOpeng05_HN, file = "mOpeng05_HN.rds")