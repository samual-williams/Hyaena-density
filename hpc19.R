library(secr)

load("inputs.RData")

# is density affected by leopards
mClosedD3 <- secr.fit(cptr_hst, model=list(D~LeopardRAI, g0~session), mask=maskClosed, detectfn=1, CL=TRUE) 
saveRDS(mClosedD3, file = "mClosedD3.rds")