library(secr)

load("inputs.RData")

# is magnitude of detection affected by humans
mOpeng06 <- secr.fit(cptr_hst, model=g0~HumanRAI, mask=maskOpen, detectfn=2, CL=TRUE)
saveRDS(mOpeng06, file = "mOpeng06.rds")