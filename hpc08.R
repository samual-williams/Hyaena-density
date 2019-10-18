library(secr)

load("inputs.RData")

# closed g0 null
mClosedg01 <- secr.fit(cptr_hst, model=g0~1, mask=maskClosed, detectfn=1, CL=FALSE) 
saveRDS(mClosedg01, file = "mClosedg01.rds")