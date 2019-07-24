library(secr)
load("inputs.RData")
HN.closed <- secr.fit(cptr_hst, mask=maskClosed, detectfn=0)
saveRDS(HN.closed, file = "HN.closed.rds")