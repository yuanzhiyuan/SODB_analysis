if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install(c("LoomExperiment", "SingleCellExperiment"))


devtools::install_github("cellgeni/sceasy")

install.packages('reticulate')
library(reticulate)
library(sceasy)
library(Seurat)


Sys.setenv(RETICULATE_PYTHON="D:\\Anaconda3\\python.exe")
use_python("D:\\Anaconda3\\python.exe")
py_config()
#py_available()
#conda_version()
#repl_python()

#RETICULATE_PYTHON="D:\\anaconda3\\python.exe"
#use_condaenv('rrr')
sceasy::convertFormat("G:\\BayesSpace\\R_V1_Mouse_Brain_Sagittal_Posterior_Section_2.h5ad", from="anndata", to="seurat",
                      outFile='G:\\BayesSpace\\R_V1_Mouse_Brain_Sagittal_Posterior_Section_2.rds')


remotes::install_github("mojaveazure/seurat-disk")
library(SeuratDisk)
library(patchwork)
#sceasy::convertFormat('D:\\server_backup\\BayesSpace\\test.rds', from="seurat", to="sce",
#                      outFile='D:\\server_backup\\BayesSpace\\V1_Mouse_Brain_Sagittal_Posterior.rds')
mbsp_temp<-readRDS(file = 'G:\\BayesSpace\\R_V1_Mouse_Brain_Sagittal_Posterior_Section_2.rds')
mbsp <-as.SingleCellExperiment(mbsp_temp)


#BiocManager::install('BayesSpace')
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
q <- 13  # Number of clusters[5,6,7,8,9,10,11,12,13,14]
d <- 15  # Number of PCs

## Run BayesSpace clustering
set.seed(104)
mbsp <- spatialCluster(mbsp, q=q, d=d, platform='Visium',
                        nrep=50000, gamma=3, save.chain=TRUE)

labels <- mbsp$spatial.cluster
label_table <-data.frame(labels)
write.table(label_table,'2_domain_9.csv',row.names=FALSE)
## View results
clusterPlot(mbsp, label=labels, palette=NULL, size=0.05) +
  scale_fill_viridis_d(option = "A", labels = 1:13) +
  labs(title="BayesSpace")

