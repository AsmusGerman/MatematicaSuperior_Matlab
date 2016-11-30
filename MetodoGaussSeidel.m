function x=MetodoGaussSeidel(A,b,x0)
n=length(A);
B=zeros(n);
D=zeros(n);
L=zeros(n);
U=zeros(n);
c=zeros(n,1);

%Elementos de la diagonal de A
D=diag(diag(A));
%Elementos por debajo de la diagonal de A
L=tril(A)-D;
%Elementos por encima de la diagonal de A
U=triu(A)-D;

B=-(inv(D+L))*U;
c=(inv(D+L))*b;

x=IteracionGaussSeidel(B,c,x0);

%no esta terminado

