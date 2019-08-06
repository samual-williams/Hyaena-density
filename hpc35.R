library(secr)

load("inputs.RData")

# is density affected by site
mOpenD2 <- secr.fit(cptr_hst, model=list(D~session, g0~session), mask=maskOpen, detectfn=2, CL=TRUE) 
saveRDS(mOpenD2, file = "mOpenD2.rds")