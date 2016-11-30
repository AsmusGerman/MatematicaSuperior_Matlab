function x=ResolverSELTriangularSuperior(A,b)
n=length(b);
x=zeros(n,1);
x(n)=b(n)/A(n,n);
    for i = n-1:-1:1
        suma=0;
        for k = n:-1:i+1
            suma=suma+A(i,k)*x(k);
        end
        x(i)=(b(i)-suma)/A(i,i);
    end
