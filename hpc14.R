library(secr)

load("inputs.RData")

# is magnitude of detection affected by reserve size
mClosedg07 <- secr.fit(cptr_hst, model=g0~ReserveSize, mask=maskClosed, detectfn=1, CL=FALSE)
saveRDS(mClosedg07, file = "mClosedg07.rds")