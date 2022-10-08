## Overall

This dir contains code for benchmarking time and memory cost of data loading approaches. This is also for reproduce the results in Supp Fig. 24.

## Compared approaches
|  Approach | Explanation   |  
| :------------: | :------------: | 
| Load from Raw | load from raw data provided by the original paper, in which data are typically presented as multiple CSV formatted files|
|Load with pysodb |  load using pysodb’s load_experiment function |
|Load with pysodb (preload) | load using pysodb’s load experiment function, if the same dataset has been previously loaded in the same machine |

## Compared datasets
|  Dataset ID | Spots   |  Genes | Technology | 
| :------------: | :------------: | :------------: | :------------: | 
|chen2021dissecting|42776|24263|Slide-seqV2| 
|chen2021dissecting|33059|23741|Slide-seqV2|
|chen2021dissecting|39206|23705|Slide-seqV2|
|chen2021dissecting|31659|24450|Slide-seqV2|
|chen2021dissecting|27194|24420|Slide-seqV2|
|chen2021dissecting|33441|23514|Slide-seqV2|




