library(secr)

load("inputs.RData")

### g0 open
# null
mOpeng01_HN <- secr.fit(cptr_hst, model=g0~1, mask=maskOpen, detectfn=0, CL=FALSE) 
saveRDS(mOpeng01_HN, file = "mOpeng01_HN.rds")