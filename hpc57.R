library(secr)

load("inputs.RData")

# is magnitude of detection affected by humans
mOpeng06_HN <- secr.fit(cptr_hst, model=g0~HumanRAI, mask=maskOpen, detectfn=0, CL=FALSE)
saveRDS(mOpeng06_HN, file = "mOpeng06_HN.rds")