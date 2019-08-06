library(secr)

load("inputs.RData")

# is density affected by spotteds
mClosedD4_HN <- secr.fit(cptr_hst, model=list(D~SpHyRAI, g0~session), mask=maskClosed, detectfn=0, CL=TRUE) 
saveRDS(mClosedD4_HN, file = "mClosedD4_HN.rds")