# Estimte brown hyaena density across South Africa
# Step 1 (previous script): Prepare data for analysis, fit detection functions, and compare DFs with AIC, so can fit use these to fit secr models in step 2
# Step 2 (this script): use selected detection functions to fit secr models. Ccheck effective sample area of best models. 

library(dplyr)
library(tibble)
library(tidyr)
library(secr)
library(rgdal)
library(sp)
library(maptools)
library(rgeos)
library(raster)
library(adehabitatHR)
library(gstat)
library(PBSmapping)
library(maptools)
library(readr)

#### Fit secr models
### g0 closed
# null
mClosedg01 <- secr.fit(cptr_hst, model=g0~1, mask=maskClosed, detectfn=1, CL=TRUE) 

# is magnitude of detection a learned response
mClosedg02 <- secr.fit(cptr_hst, model=g0~b, mask=maskClosed, detectfn=1, CL=TRUE)

# is magnitude of detection affected by site
mClosedg03 <- secr.fit(cptr_hst, model=g0~session, mask=maskClosed, detectfn=1, CL=TRUE)

# is magnitude of detection affected by leopards
mClosedg04 <- secr.fit(cptr_hst, model=g0~LeopardRAI, mask=maskClosed, detectfn=1, CL=TRUE)

# is magnitude of detection affected by spotteds
mClosedg05 <- secr.fit(cptr_hst, model=g0~SpHyRAI, mask=maskClosed, detectfn=1, CL=TRUE) 

# is magnitude of detection affected by humans
mClosedg06 <- secr.fit(cptr_hst, model=g0~HumanRAI, mask=maskClosed, detectfn=1, CL=TRUE) 

# is magnitude of detection affected by reserve size
mClosedg07 <- secr.fit(cptr_hst, model=g0~ReserveSize, mask=maskClosed, detectfn=1, CL=TRUE) 

# is magnitude of detection affected by prey RAI
mClosedg08 <- secr.fit(cptr_hst, model=g0~PreyRAI, mask=maskClosed, detectfn=1, CL=TRUE) 

# is magnitude of detection affected by fence permeability
# mClosedg09 <- secr.fit(cptr_hst, model=g0~Impenetrable, mask=maskClosed, detectfn=1, CL=TRUE) # Error in findvars.MS(trapcov, vars, c(4, 1)) : covariate factor levels differ between sessions 

### MODEL SELECTION
aic.mClosedg0 <- AIC(mClosedg01, mClosedg02, mClosedg03, mClosedg04, mClosedg05, mClosedg06, mClosedg07, mClosedg08)
aic.mClosedg0


### D closed
# null
mClosedD1 <- secr.fit(cptr_hst, model=D~1, mask=maskClosed, detectfn=1, CL=TRUE)

# is density affected by site
mClosedD2 <- secr.fit(cptr_hst, model=D~session, mask=maskClosed, detectfn=1, CL=TRUE) 

# is density affected by leopards
mClosedD3 <- secr.fit(cptr_hst, model=D~LeopardRAI, mask=maskClosed, detectfn=1, CL=TRUE) 

# is density affected by spotteds
mClosedD4 <- secr.fit(cptr_hst, model=D~SpHyRAI, mask=maskClosed, detectfn=1, CL=TRUE) 

# is density affected by humans
mClosedD5 <- secr.fit(cptr_hst, model=D~HumanRAI, mask=maskClosed, detectfn=1, CL=TRUE) 

# is density affected by reserve size
mClosedD6 <- secr.fit(cptr_hst, model=D~ReserveSize, mask=maskClosed, detectfn=1, CL=TRUE) 

# is density affected by prey RAI
mClosedD7 <- secr.fit(cptr_hst, model=D~PreyRAI, mask=maskClosed, detectfn=1, CL=TRUE) 

# is density affected by fence permeability
# mClosedD8 <- secr.fit(cptr_hst, model=D~Impenetrable, mask=maskClosed, detectfn=1, CL=TRUE) # Would have same error as g0 model with this covariate - omit


### MODEL SELECTION
aic.mClosedD <-  AIC(mClosedD1, mClosedD2, mClosedD3, mClosedD4, mClosedD5, mClosedD6, mClosedD7)
aic.mClosedD

### Use derived to get density estimates
derived(mClosedD1)


###
# Now fit models to maskOpen (buffers NOT clipped to boundaries, but infrastructure excluded)
###

#### Fit secr models

### g0 open
# null
mOpeng01 <- secr.fit(cptr_hst, model=g0~1, mask=maskOpen, detectfn=1, CL=TRUE) 

# is magnitude of detection a learned response
mOpeng02 <- secr.fit(cptr_hst, model=g0~b, mask=maskOpen, detectfn=1, CL=TRUE)

# is magnitude of detection affected by site
mOpeng03 <- secr.fit(cptr_hst, model=g0~session, mask=maskOpen, detectfn=1, CL=TRUE)

# is magnitude of detection affected by leopards
mOpeng04 <- secr.fit(cptr_hst, model=g0~LeopardRAI, mask=maskOpen, detectfn=1, CL=TRUE)

# is magnitude of detection affected by spotteds
mOpen05 <- secr.fit(cptr_hst, model=g0~SpHyRAI, mask=maskOpen, detectfn=1, CL=TRUE) 

# is magnitude of detection affected by humans
mOpen06 <- secr.fit(cptr_hst, model=g0~HumanRAI, mask=maskOpen, detectfn=1, CL=TRUE) 

# is magnitude of detection affected by reserve size
mOpeng07 <- secr.fit(cptr_hst, model=g0~ReserveSize, mask=maskOpen, detectfn=1, CL=TRUE) 

# is magnitude of detection affected by prey RAI
mClosedg08 <- secr.fit(cptr_hst, model=g0~PreyRAI, mask=maskClosed, detectfn=1, CL=TRUE) 

# # is magnitude of detection affected by fence permeability
# mOpeng08 <- secr.fit(cptr_hst, model=g0~Impenetrable, mask=maskOpen, detectfn=1, CL=TRUE) 

### MODEL SELECTION
aic.mOpeng0 <- AIC(mOpeng01, mOpeng02, mOpeng03, mOpeng04, mOpeng05, mOpeng06, mOpeng07, mOpeng08)
aic.mOpeng0


### D open
# null
mOpenD1 <- secr.fit(cptr_hst, model=D~1, mask=maskOpen, detectfn=1, CL=TRUE)

# is density affected by site
mOpenD2 <- secr.fit(cptr_hst, model=D~session, mask=maskOpen, detectfn=1, CL=TRUE) 

# is density affected by leopards
mOpenD3 <- secr.fit(cptr_hst, model=D~LeopardRAI, mask=maskOpen, detectfn=1, CL=TRUE) 

# is density affected by spotteds
mOpenD4 <- secr.fit(cptr_hst, model=D~SpHyRAI, mask=maskOpen, detectfn=1, CL=TRUE) 

# is density affected by humans
mOpenD5 <- secr.fit(cptr_hst, model=D~HumanRAI, mask=maskOpen, detectfn=1, CL=TRUE) 

# is density affected by reserve size
mOpenD6 <- secr.fit(cptr_hst, model=D~ReserveSize, mask=maskOpen, detectfn=1, CL=TRUE) 

# is density affected by prey RAI
mOpenD7 <- secr.fit(cptr_hst, model=D~PreyRAI, mask=maskClosed, detectfn=1, CL=TRUE) 

# # is density affected by fence permeability
# mOpenD7 <- secr.fit(cptr_hst, model=D~Impenetrable, mask=maskOpen, detectfn=1, CL=TRUE) 


### MODEL SELECTION open
aic.mOpenD <-  AIC(mOpenD1, mOpenD2, mOpenD3, mOpenD4, mOpenD5, mOpenD6, mOpenD7)
aic.mOpenD

### Use derived to get density estimates
derived(mOpenD1)


