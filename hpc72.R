library(secr)

load("inputs.RData")

# is density affected by humans
mClosedD5_clFALSE <- secr.fit(cptr_hst, model=list(D~HumanRAI, g0~session), mask=maskClosed, detectfn=1, CL=FALSE) 
saveRDS(mClosedD5_clFALSE, file = "mClosedD5_clFALSE.rds")