function A=dependencynetwork(Data_ori)
[x1,y1]=size(Data_ori);
OverallMatrix=zeros(y1,y1);
CorrData=corr(Data_ori);
for j=1:1:y1
    rho = partialcorr(Data_ori,Data_ori,Data_ori(:,j));
    rho(:,j)=0;
    rho(j,:)=0;
    sigmam= CorrData-rho;
    sigmam(:,j)=0;
    sigmam(j,:)=0;
    sigman=sort(sigmam,1,'descend');
    [m,n]=size(sigmam);
    A(j,:)=sum(abs(sigmam),1)./(size(sigmam,1)-1);
end
