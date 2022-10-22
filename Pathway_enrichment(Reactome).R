library(readr)
library ("ReactomePA")
library ("clusterProfiler")
library ("org.Hs.eg.db")

AB <- read.csv ("Input.csv")  # Upload file ####


uniprot2entrezID <- read.csv("uniprot2entrezID.csv")  ## for ENTREZ ID to GENE sybole ##

## Attach Entrez IDs into the inputr files

attach.entregene <- function (x,uniprotkb_col) {
  output <- merge (x, uniprot2entrezID, by.x=uniprotkb_col,by.y="UNIPROTKB",all.x=TRUE,sort=F)
  output <- output [!is.na (output$ENTREZ_GENE),]
  return (output)
}

input <- attach.entregene(AB,"Entry")       ### attach ENTREZ IDs in the table
  
y <- list (input=input$ENTREZ_GENE)

#############for Pathway enrichment analysis ########################## 


res <- compareCluster(y,fun="enrichPathway", organism = "human", 
                      pAdjustMethod="BH",readable = TRUE, pvalueCutoff = 1, 
                      minGSSize = 2, maxGSSize = 400 )

#results <- res@compareClusterResult

y.readable <- setReadable(res, OrgDb = org.Hs.eg.db, keyType = "ENTREZID")

res.readable <- as.data.frame(y.readable)


write.csv (res.readable,"ABC_mappedd.csv")

