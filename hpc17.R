library(secr)

load("inputs.RData")

### D closed
# null
mClosedD1 <- secr.fit(cptr_hst, model=D~1, mask=maskClosed, detectfn=1, CL=TRUE)
saveRDS(mClosedD1, file = "mClosedD1.rds")