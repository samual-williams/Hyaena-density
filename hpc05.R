library(secr)
load("inputs.RData")
HN.open <- secr.fit(cptr_hst, mask=maskOpen, detectfn=0)
saveRDS(HN.open, file = "HN.open.rds")