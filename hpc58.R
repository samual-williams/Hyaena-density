library(secr)

load("inputs.RData")

# is magnitude of detection affected by reserve size
mOpeng07_HN <- secr.fit(cptr_hst, model=g0~ReserveSize, mask=maskOpen, detectfn=0, CL=FALSE) 
saveRDS(mOpeng07_HN, file = "mOpeng07_HN.rds")