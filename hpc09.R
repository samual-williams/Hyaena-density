library(secr)

load("inputs.RData")

# is magnitude of detection a learned response
mClosedg02 <- secr.fit(cptr_hst, model=g0~b, mask=maskClosed, detectfn=1, CL=FALSE)
saveRDS(mClosedg02, file = "mClosedg02.rds")