function x=IteracionGaussSeidel(B,c,x0)
%creo qe no funciona bien del todo
x1=(B*x0)+c;
if (x0~=x1)
    x=IteracionGaussSeidel(B,c,x1);
else x=x1;
end