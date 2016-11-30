function x=ResolverSELTriangularInferior(A,b)
n=length(b);
x=zeros(n,1);
x(1)=b(1)/A(1,1);
    for i = 2:n
        suma=0;
        for k = 1:i-1
            suma=suma+A(i,k)*x(k);
        end
        x(i)=(b(i)-suma)/A(i,i);
    end
