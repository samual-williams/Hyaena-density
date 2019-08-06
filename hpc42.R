 
HZ.open <- readRDS(file = "HZ.open.rds")
HN.open <- readRDS(file = "HN.open.rds")
EX.open <- readRDS(file = "EX.open.rds")
aic.df.open <- AIC(HN.open, HZ.open, EX.open)
saveRDS(aic.df.open, file = "aic.df.open.rds")