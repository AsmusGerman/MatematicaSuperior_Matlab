function c=InterpNewton(x,y)
%x e y son los vectores de los valores dados
n=length(x);
N=zeros(n);
c1=zeros(n,1);

%Se calculan los valores de la matriz que se utilizara para la
%interpolacion de Newton
N(:,1)=1;
for j=2:n
    for i=2:n
        if i>=j
            prod=1;
            for k=1:j-1
                prod=prod*(x(i)-x(k));
            end;
            N(i,j)=prod;
        end;
    end;
end;

c=ReducirMatrizInterpNewton(c1,[N,y],x,1);
