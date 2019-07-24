library(secr)

load("inputs.RData")

# is magnitude of detection affected by prey RAI
mClosedg08 <- secr.fit(cptr_hst, model=g0~PreyRAI, mask=maskClosed, detectfn=1, CL=TRUE) 
saveRDS(mClosedg08, file = "mClosedg08.rds")