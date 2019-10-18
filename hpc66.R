library(secr)

load("inputs.RData")

# is density affected by prey RAI
mClosedD7_HN <- secr.fit(cptr_hst, model=list(D~PreyRAI, g0~session), mask=maskClosed, detectfn=0, CL=FALSE) 
saveRDS(mClosedD7_HN, file = "mClosedD7_HN.rds")