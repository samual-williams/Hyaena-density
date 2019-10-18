library(secr)

load("inputs.RData")

# null
mOpenD1 <- secr.fit(cptr_hst, model=list(D~1, g0~session), mask=maskOpen, detectfn=1, CL=FALSE)
saveRDS(mOpenD1, file = "mOpenD1.rds")