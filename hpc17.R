library(secr)

load("inputs.RData")

### D closed
# null
mClosedD1 <- secr.fit(cptr_hst, model=list(D~1, g0~session), mask=maskClosed, detectfn=1, CL=FALSE)
saveRDS(mClosedD1, file = "mClosedD1.rds")