function x2=MetodoSecante(fun,x0,x1)

hn=-(((feval(fun,x1))*(x1-x0))/(feval(fun,x1)-feval(fun,x0)));

x2=x1+hn;

if(abs(hn)>0.001)
    x2=MetodoSecante(fun,x1,x2);
end