#adapted from Wheeler Lab code 

library(data.table)
library(dplyr)

#paste function to concatenate filenames/paths
"%&%" = function(a,b) paste(a,b,sep="")

#grep doesn't read in lines that start with #
failed_coords = fread(cmd="grep -v '^#' /home/jacob/mibiogen37to38/lO_mibiogen_hg19_to_hg38_failures")
hg19_bed = fread("/home/jacob/mibiogen37to38/lO_mibiogen_GRCh37.bed")
hg19_snpinfo_pre = read.csv("/home/jacob/mibiogen37to38/mibiogensnps37.csv")
hg19_snpinfo = fread("/home/wheelerlab3/Data/PRS_LD_refs/ldblk_1kg_eas/snpinfo_1kg_hm3")

# write.csv(hg19_snpinfo, "/home/jacob/mibiogen37to38/mibiogen_snps_hg19.csv", row.names=FALSE)
hg19_coords = cbind(hg19_bed, hg19_snpinfo[other_allele,effect_allele])

#remove failed snps and join with successes
failed_snps = left_join(failed_coords, hg19_coords, join_by(V1,V2,V3))
success_hg19_snpinfo = filter(hg19_snpinfo, !(variant_id %in% failed_snps$variant_id))
success_hg38 = fread("/home/jacob/mibiogen37to38/lO_mibiogen_hg19_to_hg38_successes")
success_coords = cbind(success_hg38, success_hg19_snpinfo)
success_coords <- success_coords[,-4]
success_hg38_snpinfo = select(success_coords, CHR, SNP, V2, A1, A2, MAF) |> rename(BP=V2)
fwrite(success_hg38_snpinfo,"snpinfo_mibiogen_hm3_hg38", sep="\t")
