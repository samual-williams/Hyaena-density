library(secr)

load("inputs.RData")

# is density affected by humans
mClosedD5 <- secr.fit(cptr_hst, model=D~HumanRAI, mask=maskClosed, detectfn=1, CL=TRUE) 
saveRDS(mClosedD5, file = "mClosedD5.rds")