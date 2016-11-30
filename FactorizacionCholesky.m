function x=FactorizacionCholesky(A,b)
n=length(A);
x=zeros(n,1);
y=zeros(n,1);
U=zeros(n);
L=zeros(n);

%obtenemos L
for i=1:n
    %para todas las filas
    for j=1:n
        %para todas las columnas
        suma=0;
        if (i==j)
            %si el elemento esta en la diagonal
            for k=1:i-1
                suma=suma+(L(i,k)^2);
            end;
            L(i,j)=sqrt(A(i,j)-suma);
            
        else if (i>j)
                %si el elemento esta debajo de la diagonal
                for k=1:j-1
                    suma=suma+(L(j,k)*L(i,k));
                end;
                L(i,j)=(A(i,j)-suma)/L(j,j);
                
            else if(i<j)
            %si el elemento esta encima de la diagonal
            L(i,j)=0;
                end
            end
        end
    end
end

%Obtenemos U, que es igual a transponer L.
U=transpose(L);

%Siguiendo el metodo LU, A=LU.
%Por lo tanto, Ax=b, puede escribirse como LUx=b.
%Definiendo Ux=y, tenemos Ly=b.
%Entonces obtenemos el vector Y
y=ResolverSELTriangularInferior(L,b);

%Ahora resolvemos para x
x=ResolverSELTriangularSuperior(U,y);





                
                
                
                
                
                
                
                