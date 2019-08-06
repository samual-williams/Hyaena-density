library(secr)

load("inputs.RData")

# closed g0 null
mClosedg01_HN <- secr.fit(cptr_hst, model=g0~1, mask=maskClosed, detectfn=0, CL=TRUE) 
saveRDS(mClosedg01_HN, file = "mClosedg01_HN.rds")