library(secr)

load("inputs.RData")

# is magnitude of detection affected by humans
mClosedg06 <- secr.fit(cptr_hst, model=g0~HumanRAI, mask=maskClosed, detectfn=1, CL=FALSE) 
saveRDS(mClosedg06, file = "mClosedg06.rds")