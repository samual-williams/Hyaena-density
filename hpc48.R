library(secr)

load("inputs.RData")

# is magnitude of detection affected by spotteds
mClosedg05_HN <- secr.fit(cptr_hst, model=g0~SpHyRAI, mask=maskClosed, detectfn=0, CL=TRUE) 
saveRDS(mClosedg05_HN, file = "mClosedg05_HN.rds")