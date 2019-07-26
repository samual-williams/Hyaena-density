library(secr)

load("inputs.RData")

# is density affected by prey RAI
mOpenD7 <- secr.fit(cptr_hst, model=D~PreyRAI, mask=maskClosed, detectfn=1, CL=TRUE)
saveRDS(mOpenD7, file = "mOpenD7.rds")