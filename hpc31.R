library(secr)

load("inputs.RData")

# is magnitude of detection affected by reserve size
mOpeng07 <- secr.fit(cptr_hst, model=g0~ReserveSize, mask=maskOpen, detectfn=1, CL=FALSE) 
saveRDS(mOpeng07, file = "mOpeng07.rds")