library(secr)

load("inputs.RData")

# is magnitude of detection a learned response
mOpeng02 <- secr.fit(cptr_hst, model=g0~b, mask=maskOpen, detectfn=1, CL=TRUE)
saveRDS(mOpeng02, file = "mOpeng02.rds")