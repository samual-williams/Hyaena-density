library(secr)

load("inputs.RData")

# is density affected by spotteds
mClosedD4_clFALSE <- secr.fit(cptr_hst, model=list(D~SpHyRAI, g0~session), mask=maskClosed, detectfn=1, CL=FALSE) 
saveRDS(mClosedD4_clFALSE, file = "mClosedD4_clFALSE.rds")