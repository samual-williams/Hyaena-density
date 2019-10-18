library(secr)

load("inputs.RData")

# is density affected by humans
mClosedD5_HN <- secr.fit(cptr_hst, model=list(D~HumanRAI, g0~session), mask=maskClosed, detectfn=0, CL=FALSE) 
saveRDS(mClosedD5_HN, file = "mClosedD5_HN.rds")