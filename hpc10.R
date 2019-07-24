library(secr)

load("inputs.RData")

# is magnitude of detection affected by site
mClosedg03 <- secr.fit(cptr_hst, model=g0~session, mask=maskClosed, detectfn=1, CL=TRUE)
saveRDS(mClosedg03, file = "mClosedg03.rds")