library(secr)

load("inputs.RData")

# is magnitude of detection affected by prey RAI
mClosedg08_HN <- secr.fit(cptr_hst, model=g0~PreyRAI, mask=maskClosed, detectfn=0, CL=TRUE) 
saveRDS(mClosedg08_HN, file = "mClosedg08_HN.rds")