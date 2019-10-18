library(secr)

load("inputs.RData")

# is density affected by leopards
mClosedD3_HN <- secr.fit(cptr_hst, model=list(D~LeopardRAI, g0~session), mask=maskClosed, detectfn=0, CL=FALSE) 
saveRDS(mClosedD3_HN, file = "mClosedD3_HN.rds")