library(secr)

load("inputs.RData")

# is density affected by prey RAI
mOpenD7 <- secr.fit(cptr_hst, model=list(D~PreyRAI, g0~session), mask=maskClosed, detectfn=2, CL=TRUE) 
saveRDS(mOpenD7, file = "mOpenD7.rds")