library(secr)

load("inputs.RData")

# is density affected by site
mClosedD2_clFALSE <- secr.fit(cptr_hst, model=list(D~session, g0~session), mask=maskClosed, detectfn=1, CL=FALSE) 
saveRDS(mClosedD2_clFALSE, file = "mClosedD2_clFALSE.rds")