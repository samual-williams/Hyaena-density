# compare AIC of defetction functions for open (permeable) reserve boundaries
readRDS(file = "HZ.open.rds")
readRDS(file = "HN.open.rds")
# readRDS(file = "EX.open.rds")
aic.df.open <- AIC(HN.open, HZ.open)
saveRDS(aic.df.open, file = "temp.rds")

# is density affected by site
mClosedD2 <- secr.fit(cptr_hst, model=D~session, mask=maskClosed, detectfn=1, CL=TRUE) 


# density models
# is density affected by site
mClosedD2 <- secr.fit(cptr_hst, model=D~session, mask=maskClosed, detectfn=1, CL=TRUE) 
Mseason <- secr.fit(CH, model = D ~  session, mask=mask.sec, detectfn=1) 

library(secr)
?secr.fit

library(secr)
load("inputs.RData")
# Fit models without CL = TRUE
### D open
# null
mOpenD1 <- secr.fit(cptr_hst, model=D~1, mask=maskOpen, detectfn=1)

# # is density affected by site
# mOpenD2 <- secr.fit(cptr_hst, model=D~session, mask=maskOpen, detectfn=1, CL=TRUE) 


