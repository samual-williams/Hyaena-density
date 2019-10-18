library(secr)

load("inputs.RData")

mOpenD6_HN <- secr.fit(cptr_hst, model=list(D~ReserveSize, g0~session), mask=maskOpen, detectfn=0, CL=FALSE)
saveRDS(mOpenD6_HN, file = "mOpenD6_HN.rds") 