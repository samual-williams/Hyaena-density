library(secr)

load("inputs.RData")

mOpenD2_HN <- secr.fit(cptr_hst, model=list(D~session, g0~session), mask=maskOpen, detectfn=0, CL=FALSE)
saveRDS(mOpenD2_HN, file = "mOpenD2_HN.rds") 