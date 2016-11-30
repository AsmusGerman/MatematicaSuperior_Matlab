function res= PruebaMatrizTPFinal(n,V0)
%V0 es el voltaje de la tapa de la caja
%la matriz grande (la de las condiciones de borde) tiene nxn elementos 
%la matriz de u(i,j) tiene (n-2)x(n-2)
%el SEL a resolver tiene ((n-2)^2)x((n-2)^2)
%la diagonal de unos empieza en la columna (n-1) (son ((n-2)^2)-(n-2) unos)
%las diagonales abajo y arriba de la principal estan compuestas por 
%(n-3) unos y un cero, (n-3) unos y un cero............

res=zeros(n);
res(1,2:(n-1))=V0;
cantUnosDiagAlejadas=((n-2)^2)-(n-2);

%-4 en toda la diagonal principal
diagonalPrincipal=diag(ones(1,((n-2)^2))*(-4));

%diagonales de 1 (las qe estan alejadas de la diagonal principal)
diagonalesDeUnos=diag(ones(1,(cantUnosDiagAlejadas)),n-2) + diag(ones(1,(cantUnosDiagAlejadas)),-(n-2));


%diagonales de unos y ceros que estan arriba y abajo de la principal
vectorDiagonalesSecundarias=ones(1,((n-2)^2)-1);
for i=(n-2):(n-2):length(vectorDiagonalesSecundarias)
    vectorDiagonalesSecundarias(i)=0;
end;

diagonalesSecundarias=diag(vectorDiagonalesSecundarias,1)+diag(vectorDiagonalesSecundarias,-1);

%vector solucion
vectorSolucion=zeros(((n-2)^2),1);
for i=1:(n-2)
    vectorSolucion(i)=V0;
end
%matriz grande (la que tiene muchos ceros)
matrizGrande=diagonalPrincipal+diagonalesDeUnos+diagonalesSecundarias;

%x es el vector de las incognitas de la resolucion de Ax=b
x=ResolverMetodoLU(matrizGrande,vectorSolucion);

%armando el grafico panzon en forma de matriz
%reshape transforma un vector en una matriz (pero por columnas, por eso
%se usa transpose)
res(2:(n-1),2:(n-1))=transpose(reshape(x,n-2,n-2));  
    