library(secr)

load("inputs.RData")

# is magnitude of detection affected by site
mClosedg03_HN <- secr.fit(cptr_hst, model=g0~session, mask=maskClosed, detectfn=0, CL=TRUE)
saveRDS(mClosedg03_HN, file = "mClosedg03_HN.rds")