library(secr)

load("inputs.RData")

# is density affected by site
mClosedD2 <- secr.fit(cptr_hst, model=D~session, mask=maskClosed, detectfn=1, CL=TRUE) 
saveRDS(mClosedD2, file = "mClosedD2.rds")