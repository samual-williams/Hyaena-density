library(secr)

load("inputs.RData")

# is density affected by reserve size
mOpenD6 <- secr.fit(cptr_hst, model=list(D~ReserveSize, g0~session), mask=maskOpen, detectfn=2, CL=TRUE) 
saveRDS(mOpenD6, file = "mOpenD6.rds")