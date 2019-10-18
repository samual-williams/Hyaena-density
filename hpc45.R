library(secr)

load("inputs.RData")

# is magnitude of detection a learned response
mClosedg02_HN <- secr.fit(cptr_hst, model=g0~b, mask=maskClosed, detectfn=0, CL=FALSE)
saveRDS(mClosedg02_HN, file = "mClosedg02_HN.rds")