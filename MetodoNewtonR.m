function x1=MetodoNewtonR(fun,dfun,x0)

hn=-(feval(fun,x0)/feval(dfun,x0));

x1=x0+hn;

if(abs(hn)>0.001)
    x1=MetodoNewtonR(fun,dfun,x1);
end