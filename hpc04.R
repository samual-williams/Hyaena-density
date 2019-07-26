library(secr)

load("inputs.RData")

EX.closed <- secr.fit(cptr_hst, mask=maskClosed, detectfn=2)
saveRDS(EX.closed, file = "EX.closed")