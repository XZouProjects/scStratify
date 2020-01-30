##install.packages("G:/algorithms/scIdentify/R/scStratify tidy/scStratify_0.1.36.tar.gz", repos = NULL, type="source")


library(scStratify)


rm(list=ls())
graphics.off()

setwd("G:/algorithms/scIdentify/R/scStratify tidy")

options(warn=-1)


## load control data 
fileDir <- 'Ctrl B.xls'  #read entire file into string
Ctr <- read.table(fileDir)
Ctr <- matrix(as.numeric(unlist(Ctr)),dim(Ctr))
## load stimulate data 
fileDir <- 'STIM B.xls'   #read entire file into string
Case <- read.table(fileDir)
geneList <- row.names(Case)
Case <- matrix(as.numeric(unlist(Case)),dim(Case))

## Gene filtering and DE gene identification for noise reduction purpose
DEg <- DEgeneId(Ctr, Case)
Ctr_filtered <- DEg$Ctr_filtered
Case_filtered <-DEg$Case_filtered
idx_OGFSC <- DEg$idx_OGFSC
idx_DEgenes <- DEg$idx_DEgenes
geneList <- geneList[idx_OGFSC] 

## anchor cells identification
anchorCells <- findAnchors(Ctr_filtered, Case_filtered) 

## scStratify analysis
scStratify_project <- scStratify(Ctr_filtered, Case_filtered, anchorCells, idx_DEgenes, 1, geneList) 
scStratify_idx = scStratify_project$scStratify_idx
data1_corrected = scStratify_project$Ctr_corrected
data2_corrected = scStratify_project$Case_corrected
scStratify_metric = scStratify_project$scStratify_metric
bimodality = scStratify_project$Hartigans
stratifiedDEgenes = scStratify_project$stratifiedDEgenes
Pvalue = scStratify_project$P

## trajectory reconstruction using GSEA
GSEAanalysis(stratifiedDEgenes, species='Human',geneset='Hallmark',qvalue=0.05,
             outputfile ='stratified_GSEA_B_numGenes.csv')




