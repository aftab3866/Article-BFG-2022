library(readr)
library ("ReactomePA")
library ("clusterProfiler")
library ("org.Hs.eg.db")

AB <- read.csv ("Input.csv")  # Upload file ####

uniprot2entrezID <- read.csv("uniprot2entrezID.csv")  ## for ENTREZ ID to GENE symbole ##

## Attach Entrez IDs into the input files

attach.entregene <- function (x,uniprotkb_col) {
  output <- merge (x, uniprot2entrezID, by.x=uniprotkb_col,by.y="UNIPROTKB",all.x=TRUE,sort=F)
  output <- output [!is.na (output$ENTREZ_GENE),]
  return (output)
}

input <- attach.entregene(AB,"Entry")       ### attach ENTREZ IDs in the table

y <- c(input[, 4])    ## once Entrez ID attached with Input file, select only ENTERZ ID column

############# for Pathway enrichment analysis ########################## ont = "BP", "MF", and "CC"

gse <- enrichGO(y,  org.Hs.eg.db, keyType = "ENTREZID",ont = "BP", pvalueCutoff = 0.05, 
                pAdjustMethod = "BH", qvalueCutoff = 0.2, minGSSize = 10, 
                maxGSSize = 500, readable = FALSE, pool = FALSE)


y.readable <- setReadable(gse, OrgDb = org.Hs.eg.db, keyType = "ENTREZID")

res.readable <- as.data.frame(y.readable)

write.csv (res.readable,"output file.csv")

