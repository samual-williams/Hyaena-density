library(secr)

load("inputs.RData")

# is magnitude of detection affected by leopards
mClosedg04_HN <- secr.fit(cptr_hst, model=g0~LeopardRAI, mask=maskClosed, detectfn=0, CL=TRUE)
saveRDS(mClosedg04_HN, file = "mClosedg04_HN.rds")