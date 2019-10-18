library(secr)

load("inputs.RData")

# is magnitude of detection affected by leopards
mOpeng04 <- secr.fit(cptr_hst, model=g0~LeopardRAI, mask=maskOpen, detectfn=1, CL=FALSE)
saveRDS(mOpeng04, file = "mOpeng04.rds")