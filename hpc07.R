library(secr)

load("inputs.RData")

EX.open <- secr.fit(cptr_hst, mask=maskOpen, detectfn=2)
saveRDS(EX.open, file = "EX.open.rds")