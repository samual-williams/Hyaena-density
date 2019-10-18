library(secr)

load("inputs.RData")

# is density affected by site
mClosedD2_HN <- secr.fit(cptr_hst, model=list(D~session, g0~session), mask=maskClosed, detectfn=0, CL=FALSE) 
saveRDS(mClosedD2_HN, file = "mClosedD2_HN.rds")