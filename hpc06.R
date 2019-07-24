library(secr)
load("inputs.RData")
HZ.open <- secr.fit(cptr_hst, mask=maskOpen, detectfn=1)
saveRDS(HZ.open, file = "HZ.open.rds")