library(secr)

load("inputs.RData")

# is magnitude of detection affected by leopards
mOpeng04 <- secr.fit(cptr_hst, model=g0~LeopardRAI, mask=maskOpen, detectfn=2, CL=TRUE)
saveRDS(mOpeng04, file = "mOpeng04.rds")