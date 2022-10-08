if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install(c("LoomExperiment", "SingleCellExperiment"))


devtools::install_github("cellgeni/sceasy")

install.packages('reticulate')
library(reticulate)
library(sceasy)
library(Seurat)


Sys.setenv(RETICULATE_PYTHON="D:\\anaconda3\\python.exe")
use_python("D:\\anaconda3\\python.exe")
py_config()
#py_available()
#conda_version()
#repl_python()

#RETICULATE_PYTHON="D:\\anaconda3\\python.exe"
#use_condaenv('rrr')
sceasy::convertFormat("D:\\server_backup\\BayesSpace\\R_V1_Mouse_Brain_Sagittal_Posterior.h5ad", from="anndata", to="seurat",
                      outFile='D:\\server_backup\\BayesSpace\\R_V1_Mouse_Brain_Sagittal_Posterior.rds')

library(scater)

library(SeuratData)
remotes::install_github("mojaveazure/seurat-disk")
library(SeuratDisk)
library(patchwork)
#sceasy::convertFormat('D:\\server_backup\\BayesSpace\\test.rds', from="seurat", to="sce",
#                      outFile='D:\\server_backup\\BayesSpace\\V1_Mouse_Brain_Sagittal_Posterior.rds')
mbsp_temp<-readRDS(file = 'D:\\server_backup\\BayesSpace\\R_V1_Mouse_Brain_Sagittal_Posterior.rds')
mbsp <-as.SingleCellExperiment(mbsp_temp)



library(BayesSpace)
library(ggplot2)
set.seed(101)
dec <- scran::modelGeneVar(mbsp)
top <- scran::getTopHVGs(dec, n = 2000)

set.seed(102)
mbsp <- scater::runPCA(mbsp, subset_row=top)

## Add BayesSpace metadata
mbsp <- spatialPreprocess(mbsp, platform="Visium", skip.PCA=TRUE)



#Clustering with BayesSpace
q <- 14  # Number of clusters[5,6,7,8,9,10,11,12,13,14]
d <- 15  # Number of PCs

## Run BayesSpace clustering
set.seed(104)
mbsp <- spatialCluster(mbsp, q=q, d=d, platform='Visium',
                        nrep=50000, gamma=3, save.chain=TRUE)

labels <- mbsp$spatial.cluster
label_table <-data.frame(labels)
write.table(label_table,'domain_10.csv',row.names=FALSE)
## View results
clusterPlot(mbsp, label=labels, palette=NULL, size=0.05) +
  scale_fill_viridis_d(option = "A", labels = 1:14) +
  labs(title="BayesSpace")
