function [x,cont]=MetodoDeJacobi(A,b,x0)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ESTE ES INEFICIENTE, USAR MetodoDeJacobi2!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%x0 es el vector de valores iniciales del metodo de Jacobi
n=length(A);
B=zeros(n);
c=zeros(n,1);

%Formula general de las iteraciones: x(n+1)=Bx(n)+c
%calculamos la matriz B
for i=1:n
    for j=1:n
        if i~=j
        B(i,j)=-(A(i,j)/A(i,i));
        end
    end
end

%calculamos el vector c
for i=1:n
    c(i)=b(i)/A(i,i);
end

x=IteracionDeJacobi(B,c,x0);

    
    
    