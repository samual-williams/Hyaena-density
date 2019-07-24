library(secr)

load("inputs.RData")

# is magnitude of detection affected by spotteds
mClosedg05 <- secr.fit(cptr_hst, model=g0~SpHyRAI, mask=maskClosed, detectfn=1, CL=TRUE) 
saveRDS(mClosedg05, file = "mClosedg05.rds")