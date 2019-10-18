library(secr)

load("inputs.RData")

mOpenD7_HN <- secr.fit(cptr_hst, model=list(D~PreyRAI, g0~session), mask=maskOpen, detectfn=0, CL=FALSE)
saveRDS(mOpenD7_HN, file = "mOpenD7_HN.rds") 