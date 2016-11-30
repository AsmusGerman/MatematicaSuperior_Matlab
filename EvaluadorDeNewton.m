function y=EvaluadorDeNewton(x,c,xe)
%Metodo que evalua valores de x segun la interpolacion de Newton.
%x: vector de los valores dato en x
%c: coeficientes calculados por interpolacion
%xe: vector de valores en x para los cuales se quiere obtener el valor de y
n=length(c);
m=length(xe);
y=length(x);

for k=1:m
    %ciclo por cada valor de y a obtener
    suma=c(1);
    for j=1:n-1
        prod=1;
        for i=1:j
            prod=prod*((xe(k))-(x(i)));
        end;
        suma=suma+(prod*(c(i+1)));
    end;
    y(k)=suma;
end;
