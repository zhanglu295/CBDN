%load gene expression data.
%Input:The gene expression is m*n matrix, where m is the number of genes, n is the number of samples
%Output:
%1. key:important regulator,[x,y].x, index of gene;y,corresponding TIV. 
%2. edge: interaction between genes,[x,y]. x, source gene; y, target gene.
expression=load('test.txt');
[key,edge]=CBDN(expression');
