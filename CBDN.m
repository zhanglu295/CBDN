function [keyregulator,edge]=CBDN(expression,tol)
a=size(expression,2);
A=dependencynetwork(expression);
%calculate important regulator
X=sum(A,2);
[B,I]=sort(X,'descend');
keyregulator=[I B];
%dlmwrite('important_regulator.txt',[I B],'delimiter','\t');
% determine regulatory direction
for i=1:1:a
  for j=i+1:1:a
    if A(i,j)>A(j,i)
      A(j,i)=0;
    else
      A(i,j)=0;
    end
  end
end
% remove transitive edges
B=ones(a,a);
for i=1:1:a
  for j=1:1:a
    for t=1:1:a
      if A(i,j)~=0&A(j,t)~=0&A(i,t)~=0
        if  A(j,t)-A(i,t)>tol
          B(i,t)=0;
	else
          B(j,t)=0;
        end
      end
    end
  end
end
C=A.*B;
Y=sum(C,2);
[B,I]=sort(Y);
[x,y]=find(C~=0);
edge=[x,y];
end
