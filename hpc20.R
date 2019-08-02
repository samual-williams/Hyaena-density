library(secr)

load("inputs.RData")

# is density affected by spotteds
mClosedD4 <- secr.fit(cptr_hst, model=list(D~SpHyRAI, g0~session), mask=maskClosed, detectfn=1, CL=TRUE) 
saveRDS(mClosedD4, file = "mClosedD4.rds")