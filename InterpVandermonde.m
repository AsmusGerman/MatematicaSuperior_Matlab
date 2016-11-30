function c=InterpVandermonde(x,y)
n=length(x);
V=zeros(n);

for i=0:n-1
    V(:,i+1)=x.^i;
end
c=V\y';