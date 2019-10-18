library(secr)

load("inputs.RData")

# is density affected by humans
mClosedD5 <- secr.fit(cptr_hst, model=list(D~HumanRAI, g0~session), mask=maskClosed, detectfn=1, CL=FALSE) 
saveRDS(mClosedD5, file = "mClosedD5.rds")