%load gene expression data.
%Input:
%1. The gene expression is m*n matrix, where m is the number of genes, n is the number of samples;
%2. tolerance for removing transitive esges, large value means more noise tolerance.
%Output:
%1. key:important regulator,[x,y].x, index of gene;y,corresponding TIV. 
%2. edge: interaction between genes,[x,y]. x, source gene; y, target gene.
tol=0.1;
expression=load('test.txt');
[key,edge]=CBDN(expression', tol);
