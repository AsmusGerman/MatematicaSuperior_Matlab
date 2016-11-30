function Res = MetodoCuadraturaGauss(func,a,b,error,n)
%a y b son los extremos del intervalo

h=error^(1/(2*n));
Tabla=xlsread('puntosypesosGauss.xlsx',n);
x=Tabla(:,1);
w=Tabla(:,2);

Res=0;
for k=1:n
    Res=Res+(w(k)*func((((b-a)*x(k))/2)+((a+b)/2)));
end
Res=((b-a)/2)*Res;