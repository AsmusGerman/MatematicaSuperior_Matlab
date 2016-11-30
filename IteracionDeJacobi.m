function x=IteracionDeJacobi(B,c,x0)
%x0 es el vector de valores iniciales para cada iteracion
    x1=(B*x0)+c;
if (x0~=x1)
    x=IteracionDeJacobi(B,c,x1);
else x=x1;
end