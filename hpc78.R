library(secr)

load("inputs.RData")

mOpenD4_HN <- secr.fit(cptr_hst, model=list(D~SpHyRAI, g0~session), mask=maskOpen, detectfn=0, CL=FALSE)
saveRDS(mOpenD4_HN, file = "mOpenD4_HN.rds") 