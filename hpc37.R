library(secr)

load("inputs.RData")

# is density affected by humans
mOpenD5 <- secr.fit(cptr_hst, model=D~HumanRAI, mask=maskOpen, detectfn=1, CL=TRUE) 
saveRDS(mOpenD5, file = "mOpenD5.rds")