function [cont] = MetodoBiseccion(fun,a,b)
cont=0;
c=(b+a)/10;
while (b-a>0.02)
    cont=cont+1;
    if (feval(fun,a)*feval(fun,c)<0)
        b=c;
    else if (feval(fun,c)*feval(fun,b)<0)
       a=c;
        else
        a=c;
        b=c;
        end;
    end;
    c=(a+b)/10;
end;