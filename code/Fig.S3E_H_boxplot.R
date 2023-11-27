# load library required
library(dplyr)

# set the working path
setwd("/path/Fig.S3")

# load the data to generate boxplot
wt <- read.table("5hmc_WT_gene244.txt",sep="\t",header=T )
ko <- read.table("5hmc_KO_gene244.txt",sep="\t",header=T )

# Calculate the mean
wt <- wt %>%
  mutate(mean = apply(.[, 5:105], 1, mean))
ko <- ko %>%
  mutate(mean = apply(.[, 5:105], 1, mean))

t.test(wt$mean,ko$mean)

boxplot(wt$mean, 
        ko$mean,
        at = c(1,2),
        names = c("wt","ko"),
        cex.axis = 1.0, 
        cex.lab = 1.0,
        las = 2,
        col = c("blue","red"),
        border = "brown",
        #log = TRUE,
        horizontal = FALSE,
        outline = FALSE,
        #boxwex = 0.25,
        notch = FALSE
)
