library(secr)

load("inputs.RData")

### D open
# null
mOpenD1 <- secr.fit(cptr_hst, model=D~1, mask=maskOpen, detectfn=1, CL=TRUE)
saveRDS(mOpenD1, file = "mOpenD1.rds")