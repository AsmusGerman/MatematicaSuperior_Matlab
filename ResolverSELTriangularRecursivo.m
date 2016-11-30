function x = ResolverSELTriangularRecursivo(A,b)
%SolveTriangularSystem es una funcion que resuelve un sistema triangular superior
n=length(b);
x = zeros(n,1);
x(n) = b(n)/A(n,n);
if(n>1)
x(1:n - 1) = ResolverSELTriangularRecursivo(A(1:n-1,1:n-1),b(1:n-1)-A(1:n-1,n)*x(n));
end