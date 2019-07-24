library(secr)

load("inputs.RData")

# is density affected by leopards
mOpenD3 <- secr.fit(cptr_hst, model=D~LeopardRAI, mask=maskOpen, detectfn=1, CL=TRUE) 
saveRDS(mOpenD3, file = "mOpenD3.rds")