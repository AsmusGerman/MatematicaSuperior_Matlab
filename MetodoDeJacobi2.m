function [x,cont]=MetodoDeJacobi2(A,b,x0)
%x0 es el vector de valores iniciales del metodo de Jacobi
n=length(A);
B=zeros(n);
c=zeros(n,1);

D=diag(diag(A));
B=(-inv(D))*((tril(A)+triu(A))-2*D);
c=(inv(D))*b;

x=IteracionDeJacobi2(B,c,x0);