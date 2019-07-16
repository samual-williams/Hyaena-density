# Clean your environment
# rm(list=ls())

# Specify and set your working directory
# setwd("/Users/katywilliams/Documents/Katy's documents/NRF postdoc/SECR/secr/R files Courtney")

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

### CONVERT LON/LAT TO XY
panthera_traps <- read_csv("panthera traps.csv")
# xy <- project(coordinates(panthera_traps), "+proj=utm +zone=35 +south +datum=WGS84 +units=m +no_defs") # Error in .local(obj, ...) :cannot derive coordinates from non-numeric matrix
# write.csv(xy, "xy traps.csv")

### CAPTURE DATA
cptr_hst <-read.capthist('All_BH_AC.csv', list('Atherstone_BH_TD.csv','Dinokeng_BH_TD.csv','Ithala_BH_TD.csv','Khamab_BH_TD.csv','KPGR_BH_TD.csv','Kwandwe_BH_TD.csv','Lapalala_BH_TD.csv','Loskop_BH_TD.csv','Madikwe_BH_TD.csv','Pilanesberg_BH_TD.csv','Songimvelo_BH_TD.csv','Venetia_BH_TD.csv','Welgevonden_BH_TD.csv','Wonderkop_BH_TD.csv','Zingela_BH_TD.csv'), detector="proximity", fmt="trapID", trapcovnames=c('LeopardRAI','SpHyRAI','HumanRAI','ReserveSize', 'Impenetrable'), skip=1)
summary(cptr_hst, terse=TRUE)
plot(cptr_hst, border=1100, tracks=TRUE, varycol=TRUE)

### CHECKING RESERVES/TRAPS OVERLAP
prj <- "+proj=utm +zone=35 +south +datum=WGS84 +units=m +no_defs"
prjCRS <- CRS(prj)
# ath <- spTransform(readOGR("Atherstone.shp"), prjCRS)
# plot(ath)
# plot(traps(cptr_hst$Ath), add=TRUE)
# din <- spTransform(readOGR("Dinokeng.shp"), prjCRS)
# plot(din)
# plot(traps(cptr_hst$Din), add=TRUE)
# ith <- spTransform(readOGR("Ithala.shp"), prjCRS)
# plot(ith)
# plot(traps(cptr_hst$Ith), add=TRUE)
# kha <- spTransform(readOGR("Khamab.shp"), prjCRS)
# plot(kha)
# plot(traps(cptr_hst$Kha), add=TRUE)
# kpg <- spTransform(readOGR("KPGR.shp"), prjCRS)
# plot(kpg)
# plot(traps(cptr_hst$Kpg), add=TRUE)
# kwa <- spTransform(readOGR("Kwandwe.shp"), prjCRS)
# plot(kwa)
# plot(traps(cptr_hst$Kwa), add=TRUE)
# lap <- spTransform(readOGR("Lapalala.shp"), prjCRS)
# plot(lap)
# plot(traps(cptr_hst$Lap), add=TRUE)
# los <- spTransform(readOGR("Loskop.shp"), prjCRS)
# plot(los)
# plot(traps(cptr_hst$Los), add=TRUE)
# mad <- spTransform(readOGR("Madikwe.shp"), prjCRS)
# plot(mad)
# plot(traps(cptr_hst$Mad), add=TRUE)
# pil <- spTransform(readOGR("Pilanesberg.shp"), prjCRS)
# plot(pil)
# plot(traps(cptr_hst$Pil), add=TRUE)
# son <- spTransform(readOGR("Songimvelo.shp"), prjCRS)
# plot(son)
# plot(traps(cptr_hst$Son), add=TRUE)
# ven <- spTransform(readOGR("Venetia.shp"), prjCRS)
# plot(ven)
# plot(traps(cptr_hst$Ven), add=TRUE)
# wel <- spTransform(readOGR("Welgevonden.shp"), prjCRS)
# plot(wel)
# plot(traps(cptr_hst$Wel), add=TRUE)
# won <- spTransform(readOGR("Wonderkop.shp"), prjCRS)
# plot(won)
# plot(traps(cptr_hst$Won), add=TRUE)
# zin <- spTransform(readOGR("Zingela.shp"), prjCRS)
# plot(zin)
# plot(traps(cptr_hst$Zin), add=TRUE)

### GET BUFFER
suggest.buffer(cptr_hst)  ## varied from 8160 to 30164 so used 31000 to encompass all

### Create masks 

traps <- read.traps('traps.txt', detector='proximity')  

# Create mask not clippped to reserve boundaries but excluding infrastructure
# Load infrastructure
infrastructure <- readOGR("sa_infrastructure_UTM.shp")
proj4string(infrastructure) # already in UTM 35S, same as project

maskOpen <- make.mask(traps, buffer=31000, spacing=500, type='trapbuffer', poly = infrastructure, poly.habitat = FALSE) # maskOpen is NOT clippped to reserve boundaries, but excludes infrastructure
plot(maskOpen)
plot(traps(cptr_hst), add=TRUE)

# Now create mask clipped to reserve boundaries
# Create polygon of habitat (all reserves)
all <- spTransform(readOGR("all.shp"), prjCRS) # polygon of habitat (i.e. reserves)
plot(all)
plot(traps(cptr_hst), add=TRUE)

maskClosed <- make.mask(traps(cptr_hst), type='trapbuffer', spacing=500, buffer=31000, poly=all) # MaskClosed IS clipped to reserve boundaries (infrastructure irrelavent)
plot(maskClosed)
plot(traps(cptr_hst), add=TRUE)

###
# Begin with maskClosed (buffers clipped to boundaries)
###

#### TEST DETECTION FUNCTIONS

HN <- secr.fit(cptr_hst, mask=maskClosed, detectfn=0)
HZ <- secr.fit(cptr_hst, mask=maskClosed, detectfn=1)
EX <- secr.fit(cptr_hst, mask=maskClosed, detectfn=2)

aic.df.closed <- AIC(HN, HZ, EX)
aic.df.closed # HZ (1) has lowest AIC

#### FIT SECR MODEL
# | D = density                                 |
# | g0 = magnitude of detection function (capture probability when trap is at AC)       |
# | sigma = spatial scale of detection function | 

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

# is magnitude of detection affected by fence permeability
mClosedg08 <- secr.fit(cptr_hst, model=g0~Impenetrable, mask=maskClosed, detectfn=1, CL=TRUE) 

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

# is density affected by fence permeability
mClosedD7 <- secr.fit(cptr_hst, model=D~Impenetrable, mask=maskClosed, detectfn=1, CL=TRUE) 


### MODEL SELECTION
aic.mClosedD <-  AIC(modeld1, modeld2, modeld3, modeld4, modeld5, modeld6, modeld7)
aic.mClosedD

### Use derived to get density estimates
derived(mClosedD1)


######
# End of Courtney's code
######

###
# Now fit models to maskOpen (buffers NOT clipped to boundaries, but infrastructure excluded)
###

#### TEST DETECTION FUNCTIONS

HN <- secr.fit(cptr_hst, mask=maskOpen, detectfn=0)
HZ <- secr.fit(cptr_hst, mask=maskOpen, detectfn=1)
EX <- secr.fit(cptr_hst, mask=maskOpen, detectfn=2)

aic.df.open <- AIC(HN, HZ, EX)
aic.df.open # has lowest AIC

#### FIT SECR MODEL

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

# is magnitude of detection affected by fence permeability
mOpeng08 <- secr.fit(cptr_hst, model=g0~Impenetrable, mask=maskOpen, detectfn=1, CL=TRUE) 

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

# is density affected by fence permeability
mOpenD7 <- secr.fit(cptr_hst, model=D~Impenetrable, mask=maskOpen, detectfn=1, CL=TRUE) 


### MODEL SELECTION open
aic.mOpenD <-  AIC(modeld1, modeld2, modeld3, modeld4, modeld5, modeld6, modeld7)
aic.mOpenD

### Use derived to get density estimates
derived(mOpenD1)






# Experimental

### To save all rdata
#save.image(file='SECR.rdata')


### To test effective sample area ****really not sure this is right at all. BUT need to check if the esa outputs are similar to the reserve size. If similar then a truncated statespace is justified.
initialsigma <- RPSV(cptr_hst, CC = TRUE)
initialsigma #ranges between 2227.696 and 8099.016

fit <- secr.fit(cptr_hst, buffer = 31000, trace = FALSE)
esa.plot(fit)
abline(v = 4 * 8047.571, lty = 2, col = 'red') #I put in the highest initialsigma value, not sure that this is right??***

###

# Sam




