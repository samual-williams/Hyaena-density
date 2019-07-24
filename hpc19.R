library(secr)

load("inputs.RData")

# is density affected by leopards
mClosedD3 <- secr.fit(cptr_hst, model=D~LeopardRAI, mask=maskClosed, detectfn=1, CL=TRUE) 
saveRDS(mClosedD3, file = "mClosedD3.rds")