library(secr)

load("inputs.RData")

# is magnitude of detection a learned response
mOpeng02_HN <- secr.fit(cptr_hst, model=g0~b, mask=maskOpen, detectfn=0, CL=TRUE)
saveRDS(mOpeng02_HN, file = "mOpeng02_HN.rds")