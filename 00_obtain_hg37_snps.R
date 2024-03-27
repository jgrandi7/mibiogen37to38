
library(dplyr)
setwd("/home/camilla/TwoSampleMR/MiBioGen_Summary_Statistics/")

importBind <- function(x){
  temp <- list.files(pattern = paste0("*",x))
  files <- lapply(temp, read.csv)
  bind <- do.call("rbind", files)
  return(bind)
}

bind <- importBind("33462485")
#all snp files contain this header and we are merging all of them

# write uncompressed data
bind %>% write_csv("33462485.csv")
