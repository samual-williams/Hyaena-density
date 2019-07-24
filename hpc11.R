library(secr)

load("inputs.RData")

# is magnitude of detection affected by leopards
mClosedg04 <- secr.fit(cptr_hst, model=g0~LeopardRAI, mask=maskClosed, detectfn=1, CL=TRUE)
saveRDS(mClosedg04, file = "mClosedg04.rds")