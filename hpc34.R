library(secr)

load("inputs.RData")

# is density affected by site
mOpenD2 <- secr.fit(cptr_hst, model=D~session, mask=maskOpen, detectfn=1, CL=TRUE) 
saveRDS(mOpenD2, file = "mOpenD2.rds")