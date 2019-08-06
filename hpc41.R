# compare AIC of defetction functions for closed (impenetrable) reserve boundaries
HZ.closed <- readRDS(file = "HZ.closed.rds")
HN.closed <- readRDS(file = "HN.closed.rds")
EX.closed <- readRDS(file = "EX.closed.rds")
aic.df.closed <- AIC(HN.closed, HZ.closed, EX.closed)
saveRDS(aic.df.closed, file = "aic.df.closed.rds")