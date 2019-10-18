library(secr)

load("inputs.RData")

# is density affected by reserve size
mClosedD6_clFALSE <- secr.fit(cptr_hst, model=list(D~ReserveSize, g0~session), mask=maskClosed, detectfn=1, CL=FALSE) 
saveRDS(mClosedD6_clFALSE, file = "mClosedD6_clFALSE.rds")