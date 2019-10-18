library(secr)

load("inputs.RData")

mOpenD5_HN <- secr.fit(cptr_hst, model=list(D~ReserveSize, g0~session), mask=maskOpen, detectfn=0, CL=FALSE)
saveRDS(mOpenD5_HN, file = "mOpenD5_HN.rds") 