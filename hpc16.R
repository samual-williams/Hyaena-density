mClosedg01 <- readRDS(file = "mClosedg01.rds")
mClosedg02 <- readRDS(file = "mClosedg02.rds")
mClosedg03 <- readRDS(file = "mClosedg03.rds")
mClosedg04 <- readRDS(file = "mClosedg04.rds")
mClosedg05 <- readRDS(file = "mClosedg05.rds")
mClosedg06 <- readRDS(file = "mClosedg06.rds")
mClosedg07 <- readRDS(file = "mClosedg07.rds")
mClosedg08 <- readRDS(file = "mClosedg08.rds")

aic.mClosedg0 <- AIC(mClosedg01, mClosedg02, mClosedg03, mClosedg04, mClosedg05, mClosedg06, mClosedg07, mClosedg08)

saveRDS(aic.mClosedg0, file = "aic.mClosedg0.rds")