readRDS(file = "mClosedg01.rds")
readRDS(file = "mClosedg02.rds")
readRDS(file = "mClosedg03.rds")
readRDS(file = "mClosedg04.rds")
readRDS(file = "mClosedg05.rds")
readRDS(file = "mClosedg06.rds")
readRDS(file = "mClosedg07.rds")
readRDS(file = "mClosedg08.rds")

# # or
# 
# # readload all .rds files in working directory
# library(tidyverse)
# df <- list.files(pattern = ".rds") %>%
#   map_dfr(readRDS)

aic.mClosedg0 <- AIC(mClosedg01, mClosedg02, mClosedg03, mClosedg04, mClosedg05, mClosedg06, mClosedg07, mClosedg08)

saveRDS(mClosedg08, file = "aic.mClosedg0.rds")