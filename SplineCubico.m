function S = SplineCubico(X,x)
%Programa que calcula el valor de la funcion spline cubico S(x)
%X es una matriz que tiene los valores de x e y a interpolar (los de x en 
%su primera fila y los de y en la segunda)
%x es un valor de x en el cual se desea saber el valor de la funcion S(x)

n = length(X);
h = zeros(1,n-1);
for l=1:n-1
  h(l)=X(1,l+1)-X(1,l);
end;

lambda = zeros(1,n);
%El primer y ultimo valor de lambda son = 0

for l=2:n-1
  lambda(l)=h(l)/(h(l-1) + h(l));
end;

mu = zeros(1,n);
%El primer y ultimo valor de mu son = 0

for l=2:n-1
  mu(l)=h(l-1)/(h(l-1) + h(l));
end;

d = zeros(1,n);
%El primer y ultimo valor de d son = 0

for l=2:n-1
  d(l)=(6/(h(l-1)+h(l)))*(((X(2,l+1)-X(2,l))/h(l))-((X(2,l)-X(2,l-1))/h(l-1)));
end;

z = zeros(1,n);
%El primer y ultimo valor de z son = 0

M = diag(ones(n,1)*2);
M(1,1)=2;
M(n,n)=2;
for i=2:n-1
  for j=1:n
  if(i-j==1) 
      M(i,j)=mu(j+1);
  elseif(j-i==1) 
      M(i,j)= lambda(i);
  end;
  end;
end;

z = M\(d)';

%Se determina en que intervalo esta el valor buscado
%xi es el extremo izquierdo del intervalo, xj el extremo derecho
%zi y zj son las constantes correspondientes a ese intervalo
%yi e yj son los valores de y correspondientes a xi y xj

%Aclaracion: se usa la notacion 'j' en el nombre de las variables 'xj', 
%'yj', 'zj' para denotar 'i+1'

for i=1:n
    if (X(1,i)<x && x<X(1,i+1))
        xi=X(1,i);
        xj=X(1,i+1);
        hl=xj-xi;
        zi=z(i);
        zj=z(i+1);
        yi=X(2,i);
        yj=X(2,i+1);
        break;
    end;
end;

%Finalmente se obtiene el valor de S(x)
S= (((zi*(hl^2))/6) * ((((xj-x)/hl)^3)-((xj-x)/hl))) + ...
    (yi*((xj)-x)/hl) + (((zj*(hl^2))/6) * ((((x-xi)/hl)^3)-((x-xi)/hl))) + ...
    ((yj)*((x-xi)/hl));
 