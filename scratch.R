# On HPC 
# compare AIC of defetction functions for open (permeable) reserve boundaries
readRDS(file = "HZ.open.rds")
readRDS(file = "HN.open.rds")
# readRDS(file = "EX.open.rds")
aic.df.open <- AIC(HN.open, HZ.open)
saveRDS(aic.df.open, file = "temp.rds")

####

# on local machine
load("inputs.RData")
mClosedD1 <- secr.fit(cptr_hst, model=D~1, mask=maskClosed, detectfn=1, CL=TRUE)
mClosedD2 <- secr.fit(cptr_hst, model=D~session, mask=maskClosed, detectfn=1, CL=TRUE) 
AIC(mClosedD1, mClosedD2)

# Experimental

### To save all rdata
#save.image(file='SECR.rdata')


# ### To test effective sample area ****really not sure this is right at all. BUT need to check if the esa outputs are similar to the reserve size. If similar then a truncated statespace is justified.
# initialsigma <- RPSV(cptr_hst, CC = TRUE)
# initialsigma #ranges between 2227.696 and 8099.016
# 
# fit <- secr.fit(cptr_hst, buffer = 31000, trace = FALSE)
# esa.plot(fit)
# abline(v = 4 * 8047.571, lty = 2, col = 'red') #I put in the highest initialsigma value, not sure that this is right??***
# 
# ###
# 
# # Sam
# # To do
# # - Check how models look using HN (0)

