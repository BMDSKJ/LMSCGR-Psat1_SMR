load("~/s5_s6_60h_pbmc.RData")
TSNEPlot(s5_s6_60h_pbmc,do.label = F)
s5_s6_60h_pbmc_new<-s5_s6_60h_pbmc
s5_s6_60h_cur.cluster.ids <- c(0, 1, 2, 3, 4,5)
#s5_s6_60h_new.cluster.ids <- c("S7", "S5+S6+S7", "S6+S7", "S5+S6+S7", "S7")
#s5_s6_60h_new.cluster.ids <- c("CQ", "60h_1", "60h_2", "A", "60h_3","60h_A")
s5_s6_60h_new.cluster.ids <- c("Q", "60h", "60h", "Q", "60h","60h")
s5_s6_60h_pbmc_new@ident <- plyr::mapvalues(s5_s6_60h_pbmc_new@ident, from =s5_s6_60h_cur.cluster.ids, to = s5_s6_60h_new.cluster.ids)
TSNEPlot(s5_s6_60h_pbmc_new, do.label = F, pt.size = 0.5)

#FeatureHeatmap(object = s5_s6_60h_pbmc_new, features.plot = c("Phgdh","Psat1","Psph"), 
#               sep.scale = TRUE, pt.size = 0.5, cols.use = c("lightgrey","blue"))
FeaturePlot(object = s5_s6_60h_pbmc_new, features.plot = c("Phgdh","Psat1","Psph"),no.legend = FALSE, cols.use = c("lightgrey","blue"),do.return = TRUE)+ theme_set(theme_cowplot())
