library(secr)

load("inputs.RData")

mOpenD3_HN <- secr.fit(cptr_hst, model=list(D~LeopardRAI, g0~session), mask=maskOpen, detectfn=0, CL=FALSE)
saveRDS(mOpenD3_HN, file = "mOpenD3_HN.rds") 