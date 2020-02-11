# scStratify
scStratify - a single-cell RNA-seq data interpretation software

1. intall python
2. intall the chrome webdriver if necessary
3. install the scStratify R package: scStratify_0.1.37.tar.gz
4. download the demo data: scStratify demo data.zip
5. run the script: run_demo_scStratify.R

The scStratify can plot 3 figures.
1. the distribution of SS_PLS2 metric of the case cells, which indicates the distribution of the biological signal contained in the case cells.
2. the cell transition velocity scatter plot, which demonstrates the trends of cell state transition.
3. the activated GSEA cell function terms of differnt groups of case cells, which illustates the cell function transition from less active to more active cells.

NOTES: The 'GSEAanalysis' function requires python and a webdriver to automatically conduct GSEA analysis. The intall instructions for windows and Mac systems are shown in the 'python_Documentation_Windows.docx' and 'python_Documentation_Mac.docx', respectively.
