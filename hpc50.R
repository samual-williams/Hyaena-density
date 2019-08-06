library(secr)

load("inputs.RData")

# is magnitude of detection affected by reserve size
mClosedg07_HN <- secr.fit(cptr_hst, model=g0~ReserveSize, mask=maskClosed, detectfn=0, CL=TRUE)
saveRDS(mClosedg07_HN, file = "mClosedg07_HN.rds")