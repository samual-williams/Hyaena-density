library(secr)

load("inputs.RData")

# is magnitude of detection affected by prey RAI
mOpeng08 <- secr.fit(cptr_hst, model=g0~PreyRAI, mask=maskClosed, detectfn=1, CL=TRUE)
saveRDS(mOpeng08, file = "mOpeng08.rds")