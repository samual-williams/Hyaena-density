# # Estimte brown hyaena density across South Africa
# # Step 1 (this script): Prepare data for analysis, fit detection functions, and compare DFs with AIC, so can fit use these to fit secr models in step 2
# # Step 2 (next script): use selected detection functions to fit secr models. Ccheck effective sample area of best models. 
# 
# # rm(list=ls()) # clear environment
# 
# library(dplyr)
# library(tibble)
# library(tidyr)
# library(secr)
# library(rgdal)
# library(sp)
# library(maptools)
# library(rgeos)
# library(raster)
# library(adehabitatHR)
# library(gstat)
# library(PBSmapping)
# library(maptools)
# library(readr)
# 
# ### Capture data
# cptr_hst <-read.capthist('All_BH_AC.csv', list('Atherstone_BH_TD.csv','Dinokeng_BH_TD.csv','Ithala_BH_TD.csv','Khamab_BH_TD.csv','KPGR_BH_TD.csv','Kwandwe_BH_TD.csv','Lapalala_BH_TD.csv','Loskop_BH_TD.csv','Madikwe_BH_TD.csv','Pilanesberg_BH_TD.csv','Songimvelo_BH_TD.csv','Venetia_BH_TD.csv','Welgevonden_BH_TD.csv','Wonderkop_BH_TD.csv','Zingela_BH_TD.csv'), detector="proximity", fmt="trapID", trapcovnames=c('LeopardRAI','SpHyRAI','HumanRAI','PreyRAI','ReserveSize','Impenetrable'), skip=1)
# 
# # Set CRS
# prj <- "+proj=utm +zone=35 +south +datum=WGS84 +units=m +no_defs"
# prjCRS <- CRS(prj)
# 
# ### Get buffer
# buffer <- suggest.buffer(cptr_hst)  ## varied from 8160 to 30164 so used 31000 to encompass all
# buffer
# 
# ### Create masks 
# traps <- read.traps('traps.txt', detector='proximity') # load traps
# 
# # Create mask not clippped to reserve boundaries but excluding infrastructure
# infrastructure <- readOGR("sa_infrastructure_UTM.shp") # load infrastructure
# 
# maskOpen <- make.mask(traps, buffer=31000, spacing=500, type='trapbuffer', poly = infrastructure, poly.habitat = FALSE) # maskOpen is NOT clippped to reserve boundaries, but excludes infrastructure
# 
# # Now create mask clipped to reserve boundaries
# # Create polygon of habitat (all reserves)
# all <- spTransform(readOGR("all.shp"), prjCRS) # load polygon of habitat (i.e. all reserves)
# 
# maskClosed <- make.mask(traps(cptr_hst), type='trapbuffer', spacing=500, buffer=31000, poly=all) # MaskClosed IS clipped to reserve boundaries (infrastructure noit relavent)
# 
# ###
# # Begin with maskClosed (buffers clipped to boundaries)
# ###


#### TEST DETECTION FUNCTIONS
HN.closed <- secr.fit(cptr_hst, mask=maskClosed, detectfn=0)
HZ.closed <- secr.fit(cptr_hst, mask=maskClosed, detectfn=1)
EX.closed <- secr.fit(cptr_hst, mask=maskClosed, detectfn=2)

aic.df.closed <- AIC(HN.closed, HZ.closed, EX.closed)
aic.df.closed # HZ (1) has lowest AIC

###
# Now fit models to maskOpen (buffers NOT clipped to boundaries, but infrastructure excluded)
###

#### TEST DETECTION FUNCTIONS

HN.open <- secr.fit(cptr_hst, mask=maskOpen, detectfn=0)
HZ.open <- secr.fit(cptr_hst, mask=maskOpen, detectfn=1)
EX.open <- secr.fit(cptr_hst, mask=maskOpen, detectfn=2)

aic.df.open <- AIC(HN.open, HZ.open, EX.open)
aic.df.open 