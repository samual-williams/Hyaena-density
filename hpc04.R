library(secr)

load("inputs.RData")

readRDS(file = "HZ.closed.rds")
readRDS(file = "HN.closed.rds")

EX.closed <- secr.fit(cptr_hst, mask=maskClosed, detectfn=2)
saveRDS(EX.closed, file = "EX.closed")

aic.df.closed <- AIC(HN.closed, HZ.closed, EX.closed)
saveRDS(EX.closed, file = "aic.df.closed")