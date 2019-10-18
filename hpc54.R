library(secr)

load("inputs.RData")

# is magnitude of detection affected by site
mOpeng03_HN <- secr.fit(cptr_hst, model=g0~session, mask=maskOpen, detectfn=0, CL=FALSE)
saveRDS(mOpeng03_HN, file = "mOpeng03_HN.rds")