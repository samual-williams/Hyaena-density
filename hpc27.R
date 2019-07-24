library(secr)

load("inputs.RData")

# is magnitude of detection affected by site
mOpeng03 <- secr.fit(cptr_hst, model=g0~session, mask=maskOpen, detectfn=1, CL=TRUE)
saveRDS(mOpeng03, file = "mOpeng03.rds")