library(secr)
load("inputs.RData")
HZ.closed <- secr.fit(cptr_hst, mask=maskClosed, detectfn=1)
saveRDS(HZ.closed, file = "HZ.closed.rds")