library(secr)

load("inputs.RData")

### D closed
# null
mOpenD1_HN <- secr.fit(cptr_hst, model=list(D~1, g0~session), mask=maskOpen, detectfn=0, CL=FALSE)
saveRDS(mOpenD1_HN, file = "mOpenD1_HN.rds") 