library(secr)

load("inputs.RData")

# is density affected by reserve size
mOpenD6 <- secr.fit(cptr_hst, model=D~ReserveSize, mask=maskOpen, detectfn=1, CL=TRUE)
saveRDS(mOpenD6, file = "mOpenD6.rds")