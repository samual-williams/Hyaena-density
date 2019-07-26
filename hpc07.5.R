# compare AIC of defetction functions for open (permeable) reserve boundaries
readRDS(file = "HZ.open.rds")
readRDS(file = "HN.open.rds")
readRDS(file = "EX.open.rds")
aic.df.open <- AIC(HN.open, HZ.open, EX.open)
saveRDS(aic.df.open, file = "aic.df.open.rds")