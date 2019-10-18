library(secr)

load("inputs.RData")

### D closed
# null
mClosedD1_clFALSE <- secr.fit(cptr_hst, model=list(D~1, g0~session), mask=maskClosed, detectfn=1, CL=FALSE)
saveRDS(mClosedD1_clFALSE, file = "mClosedD1_clFALSE.rds")