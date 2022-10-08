## Overall
This dir contains the code for comparing SOView with other spatial clustering methods.
<br>The compared methods are:
## Compared methods
|  Name | Year   |  Package | Website | Input| Parameter settings |
| :------------: | :------------: | :------------: |:------------: |:------------: |:------------: |
|  SpaGCN | 2021 |  Python | [Link](https://github.com/jianhuupenn/SpaGCN)|Gene expression, spatial information, histology images | res=0.1/0.5/1/1.5/2/2.5/3/3.5/4/4.5|
|  BayesSpace | 2021 |  R | [Link](https://github.com/edward130603/BayesSpace)|Gene expression, spatial information | k=5/6/7/8/9/10/11/12/13/14|
|  SEDR | 2021 |  Python | [Link](https://github.com/HzFu/SEDR)|Gene expression, spatial information | res=0.1/0.5/1/1.5/2/2.5/3/3.5/4/4.5|
|  STAGATE | 2022 |  Python | [Link](https://github.com/zhanglabtools/STAGATE)|Gene expression, spatial information | k=5/6/7/8/9/10/11/12/13/14|
|  CCST_Louvain | 2022 |  Python | [Link](https://github.com/xiaoyeye/CCST)|Gene expression, spatial information | res=0.1/0.5/1/1.5/2/2.5/3/3.5/4/4.5|
|  CCST_Leiden | 2022 |  Python | [Link](https://github.com/xiaoyeye/CCST)|Gene expression, spatial information | res=0.1/0.5/1/1.5/2/2.5/3/3.5/4/4.5|
|  conST | 2022 |  Python | [Link](https://github.com/ys-zong/conST)|Gene expression, spatial information | k=5/6/7/8/9/10/11/12/13/14|
|  SCAN-IT | 2021 |  Python | [Link](https://github.com/zcang/SCAN-IT)|Gene expression, spatial information | res=0.1/0.5/1/1.5/2/2.5/3/3.5/4/4.5|
|  SpaceFlow | 2022 |  Python | [Link](https://github.com/hongleir/SpaceFlow)|Gene expression, spatial information | res=0.1/0.5/1/1.5/2/2.5/3/3.5/4/4.5|

## Note
<br> Dir "**AllResult**" summarize all the output of separate algirithms and generate figures for Supp Fig. 25~42 ("img" path), and result data ("h5ad" path).

## Example
Take BayesSpace as an example. Following figures show BayesSpace results on ten parameters, as well as the zoomed-in plot.
![BayesSpace](../Images/BayesSpace_rep1.png)
![BayesSpace zoom-in](../Images/BayesSpace_rep1_ROI.png)




