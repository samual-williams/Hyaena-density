library(secr)

load("inputs.RData")

# is magnitude of detection affected by humans
mClosedg06_HN <- secr.fit(cptr_hst, model=g0~HumanRAI, mask=maskClosed, detectfn=0, CL=TRUE) 
saveRDS(mClosedg06_HN, file = "mClosedg06_HN.rds")