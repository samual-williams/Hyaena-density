library(secr)

load("inputs.RData")

# is density affected by prey RAI
mClosedD7 <- secr.fit(cptr_hst, model=list(D~PreyRAI, g0~session), mask=maskClosed, detectfn=1, CL=FALSE) 
saveRDS(mClosedD7, file = "mClosedD7.rds")