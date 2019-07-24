library(secr)

load("inputs.RData")

# is density affected by spotteds
mOpenD4 <- secr.fit(cptr_hst, model=D~SpHyRAI, mask=maskOpen, detectfn=1, CL=TRUE) 
saveRDS(mOpenD4, file = "mOpenD4.rds")