library(secr)

load("inputs.RData")

# is magnitude of detection affected by leopards
mOpeng04_HN <- secr.fit(cptr_hst, model=g0~LeopardRAI, mask=maskOpen, detectfn=0, CL=TRUE)
saveRDS(mOpeng04_HN, file = "mOpeng04_HN.rds")