library(secr)

load("inputs.RData")

# is density affected by reserve size
mClosedD6_HN <- secr.fit(cptr_hst, model=list(D~ReserveSize, g0~session), mask=maskClosed, detectfn=0, CL=TRUE) 
saveRDS(mClosedD6_HN, file = "mClosedD6_HN.rds")