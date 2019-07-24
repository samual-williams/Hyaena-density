library(secr)

load("inputs.RData")

# is density affected by prey RAI
mClosedD7 <- secr.fit(cptr_hst, model=D~PreyRAI, mask=maskClosed, detectfn=1, CL=TRUE)
saveRDS(mClosedD7, file = "mClosedD7.rds")