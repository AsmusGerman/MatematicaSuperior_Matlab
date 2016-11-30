function x=ResolverMetodoLU(A,b)
n=length(A);
L=size(n);
U=size(n);
y=zeros(n,1);
x=zeros(n,1);

[L,U]=EncontrarLU(A);

%Dado que L es triangular inferior, hay que rotarla de lado a lado y de
%arriba a abajo, asi como tambien el vector b y el resultado
%rot90(L,2) es equivalente a fliplr(flipud(L))
y=flipud(ResolverSELTriangularRecursivo(rot90(L,2),flipud(b)));

x=ResolverSELTriangularRecursivo(U,y);
