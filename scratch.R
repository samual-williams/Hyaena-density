load("/Users/samwilliams/Documents/Sam docs/Work/Publications/Hyaena density/Saving beans/SECR.rdata")


# Cutting out infrastructure from mask

# load infrastructure
infrastructure <- readOGR("sa_infrastructure_UTM.shp")
class(infrastructure)
proj4string(infrastructure) # already in UTM 35S
proj4string(all)
prjCRS # CRS of project is the same

mask3 <- make.mask(traps, buffer=31000, spacing=500, type='trapbuffer', poly = infrastructure, poly.habitat = FALSE) 
class(mask3)
library(beepr)
beep(2)
plot(mask3)

write.csv(mask3, "mask3.csv")




