library(secr)

load("inputs.RData")

# is density affected by leopards
mOpenD3 <- secr.fit(cptr_hst, model=list(D~LeopardRAI, g0~session), mask=maskOpen, detectfn=2, CL=TRUE) 
saveRDS(mOpenD3, file = "mOpenD3.rds")