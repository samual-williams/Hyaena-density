# compare AIC of defetction functions for closed (impenetrable) reserve boundaries
readRDS(file = "HZ.closed.rds")
readRDS(file = "HN.closed.rds")
readRDS(file = "EX.closed.rds")
aic.df.closed <- AIC(HN.closed, HZ.closed, EX.closed)
saveRDS(aic.df.closed, file = "aic.df.closed.rds")