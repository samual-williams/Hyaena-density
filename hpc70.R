library(secr)

load("inputs.RData")

# is density affected by leopards
mClosedD3_clFALSE <- secr.fit(cptr_hst, model=list(D~LeopardRAI, g0~session), mask=maskClosed, detectfn=1, CL=FALSE) 
saveRDS(mClosedD3_clFALSE, file = "mClosedD3_clFALSE.rds")