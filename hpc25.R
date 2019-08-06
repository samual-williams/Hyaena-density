library(secr)

load("inputs.RData")

### g0 open
# null
mOpeng01 <- secr.fit(cptr_hst, model=g0~1, mask=maskOpen, detectfn=2, CL=TRUE) 
saveRDS(mOpeng01, file = "mOpeng01.rds")