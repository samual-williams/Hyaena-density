library(secr)

load("inputs.RData")

readRDS(file = "HZ.open.rds")
readRDS(file = "HN.open.rds")

EX.open <- secr.fit(cptr_hst, mask=maskOpen, detectfn=2)
saveRDS(EX.open, file = "EX.open.rds")

aic.df.open <- AIC(HN.open, HZ.open, EX.open)
saveRDS(aic.df.open, file = "aic.df.open.rds")






