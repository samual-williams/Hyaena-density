library(secr)

# # Comparing models
#
# # closed density models with half normal DF
# mClosedD1_HN <- readRDS(file = "mClosedD1_HN.rds")
# mClosedD2_HN <- readRDS(file = "mClosedD2_HN.rds")
# mClosedD3_HN <- readRDS(file = "mClosedD3_HN.rds")
# mClosedD4_HN <- readRDS(file = "mClosedD4_HN.rds")
# mClosedD5_HN <- readRDS(file = "mClosedD5_HN.rds")
# mClosedD6_HN <- readRDS(file = "mClosedD6_HN.rds")
# mClosedD7_HN <- readRDS(file = "mClosedD7_HN.rds")
# 
# aic.mClosedD_HN <- AIC(mClosedD1_HN, mClosedD2_HN, mClosedD3_HN, mClosedD4_HN, mClosedD5_HN, mClosedD6_HN, mClosedD7_HN)
# aic.mClosedD_HN
# saveRDS(aic.mClosedD_HN, file = "aic.mClosedD_HN.rds")
# 
# # closed g0 models with half normal DF
# mClosedg01_HN <- readRDS(file = "mClosedg01_HN.rds")
# mClosedg02_HN <- readRDS(file = "mClosedg02_HN.rds")
# mClosedg03_HN <- readRDS(file = "mClosedg03_HN.rds")
# mClosedg04_HN <- readRDS(file = "mClosedg04_HN.rds")
# mClosedg05_HN <- readRDS(file = "mClosedg05_HN.rds")
# mClosedg06_HN <- readRDS(file = "mClosedg06_HN.rds")
# mClosedg07_HN <- readRDS(file = "mClosedg07_HN.rds")
# mClosedg08_HN <- readRDS(file = "mClosedg08_HN.rds")
# 
# aic.mClosedg0_HN <- AIC(mClosedg01_HN, mClosedg02_HN, mClosedg03_HN, mClosedg04_HN, mClosedg05_HN, mClosedg06_HN, mClosedg07_HN, mClosedg08_HN)
# aic.mClosedg0_HN
# saveRDS(aic.mClosedg0_HN, file = "aic.mClosedg0_HN.rds")

###

# # # testing density models with CL=FALSE to see if that stops all density models being the same
# mClosedD1_clFALSE <- readRDS("mClosedD1_clFALSE.rds")
# # mClosedD2_clFALSE <- readRDS("mClosedD2_clFALSE.rds")
# mClosedD3_clFALSE <- readRDS("mClosedD3_clFALSE.rds")
# mClosedD4_clFALSE <- readRDS("mClosedD4_clFALSE.rds")
# mClosedD5_clFALSE <- readRDS("mClosedD5_clFALSE.rds")
# mClosedD6_clFALSE <- readRDS("mClosedD6_clFALSE.rds")
# mClosedD7_clFALSE <- readRDS("mClosedD7_clFALSE.rds")
# # aic.mClosedD_clFALSE <- AIC(mClosedD1_clFALSE, mClosedD2_clFALSE, mClosedD3_clFALSE, mClosedD4_clFALSE, mClosedD5_clFALSE, mClosedD6_clFALSE, mClosedD7_clFALSE)
# # saveRDS(aic.mClosedD_clFALSE, file = "aic.mClosedD_clFALSE.rds")
# # # local
# # aic.mClosedD_clFALSE <- readRDS("aic.mClosedD_clFALSE.rds")
# # aic.mClosedD_clFALSE
# 
# # Again minus D~session
# aic.mClosedD_clFALSE_exclD.Session <- AIC(mClosedD1_clFALSE, mClosedD3_clFALSE, mClosedD4_clFALSE, mClosedD5_clFALSE, mClosedD6_clFALSE, mClosedD7_clFALSE)
# saveRDS(aic.mClosedD_clFALSE_exclD.Session, file = "aic.mClosedD_clFALSE_exclD.Session.rds")
# 
# # local
# aic.mClosedD_clFALSE_exclD.Session <- readRDS("aic.mClosedD_clFALSE_exclD.Session.rds")
# aic.mClosedD_clFALSE_exclD.Session

# Thursday 22/8/19 
# # comparing open g0 models (all) and open D models that have finished mOpend1, 6, 7)
# mOpeng01 <- readRDS("mOpeng01.rds")
# mOpeng02 <- readRDS("mOpeng02.rds")
# mOpeng03 <- readRDS("mOpeng03.rds")
# mOpeng04 <- readRDS("mOpeng04.rds")
# mOpeng05 <- readRDS("mOpeng05.rds")
# mOpeng06 <- readRDS("mOpeng06.rds")
# mOpeng07 <- readRDS("mOpeng07.rds")
# mOpeng08 <- readRDS("mOpeng08.rds")
# aic.mOpeng0 <- AIC(mOpeng01, mOpeng02, mOpeng03, mOpeng04, mOpeng05, mOpeng06, mOpeng07, mOpeng08)
# saveRDS(aic.mOpeng0, file = "aic.mOpeng0.rds")

# # comparing open D models that have finished all ( except mOpenD2)
# mOpenD1 <- readRDS("mOpenD1.rds")
# # mOpenD2 <- readRDS("mOpenD2.rds")
# mOpenD3 <- readRDS("mOpenD3.rds")
mOpenD4 <- readRDS("mOpenD4.rds")
mOpenD5 <- readRDS("mOpenD5.rds")
# mOpenD6 <- readRDS("mOpenD6.rds")
mOpenD7 <- readRDS("mOpenD7.rds")
# aic.mOpenD <- AIC(mOpenD1, mOpenD3, mOpenD4, mOpenD5, mOpenD6, mOpenD7)
# saveRDS(aic.mOpenD, file = "aic.mOpenD.rds")

mOpenModavg <- model.average(mOpenD7, mOpenD4, mOpenD5, criterion = "AIC")
saveRDS(mOpenModavg, file = "mOpenModavg.rds")



