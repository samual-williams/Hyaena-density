library(secr)

load("inputs.RData")

### D closed
# null
mClosedD1_HN <- secr.fit(cptr_hst, model=list(D~1, g0~session), mask=maskClosed, detectfn=0, CL=TRUE)
saveRDS(mClosedD1_HN, file = "mClosedD1_HN.rds")