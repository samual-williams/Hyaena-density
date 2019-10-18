rm(list=ls()) # clear environment

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

### Capture data
cptr_hst <-read.capthist('All_BH_AC.csv', list('Atherstone_BH_TD.csv','Dinokeng_BH_TD.csv','Ithala_BH_TD.csv','Khamab_BH_TD.csv','KPGR_BH_TD.csv','Kwandwe_BH_TD.csv','Lapalala_BH_TD.csv','Loskop_BH_TD.csv','Madikwe_BH_TD.csv','Pilanesberg_BH_TD.csv','Songimvelo_BH_TD.csv','Venetia_BH_TD.csv','Welgevonden_BH_TD.csv','Wonderkop_BH_TD.csv','Zingela_BH_TD.csv'), detector="proximity", fmt="trapID", trapcovnames=c('LeopardRAI','SpHyRAI','HumanRAI','PreyRAI','ReserveSize','Impenetrable'), skip=1)

# Set CRS
prj <- "+proj=utm +zone=35 +south +datum=WGS84 +units=m +no_defs"
prjCRS <- CRS(prj)

### Get buffer
buffer <- suggest.buffer(cptr_hst)  ## varied from 8160 to 30164 so used 31000 to encompass all
buffer

### Create masks
traps <- read.traps('traps.txt', detector='proximity') # load traps

# Create mask not clippped to reserve boundaries but excluding infrastructure
infrastructure <- readOGR("sa_infrastructure_UTM.shp") # load infrastructure

maskOpen <- make.mask(traps(cptr_hst), buffer=31000, spacing=500, type='trapbuffer', poly = infrastructure, poly.habitat = FALSE) # maskOpen is NOT clippped to reserve boundaries, but excludes infrastructure
head(covariates(maskOpen)) # not there

### ADD COVARIATES TO MASK
maskOpen <- addCovariates(maskOpen, traps(cptr_hst))
head(covariates(maskOpen)) # there

# Now create mask clipped to reserve boundaries
# Create polygon of habitat (all reserves)
all <- spTransform(readOGR("all.shp"), prjCRS) # load polygon of habitat (i.e. all reserves)

maskClosed <- make.mask(traps(cptr_hst), type='trapbuffer', spacing=500, buffer=31000, poly=all) # MaskClosed IS clipped to reserve boundaries (infrastructure not relavent)

head(covariates(maskClosed)) # not there!

### ADD COVARIATES TO MASK
maskClosed <- addCovariates(maskClosed, traps(cptr_hst))
head(covariates(maskClosed)) # there

save.image(file = "inputs.RData")