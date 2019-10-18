library(secr)

load("inputs.RData")

# is magnitude of detection affected by prey RAI
mOpeng08_HN <- secr.fit(cptr_hst, model=g0~PreyRAI, mask=maskClosed, detectfn=0, CL=FALSE)
saveRDS(mOpeng08_HN, file = "mOpeng08_HN.rds")