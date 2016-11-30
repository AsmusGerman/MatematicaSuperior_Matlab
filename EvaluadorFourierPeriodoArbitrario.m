function y = EvaluadorFourierPeriodoArbitrario(funcA,vectorX,terminoN,error)

m = length(vectorX);
y = size(vectorX);

ak=m;
bk=m;

T=vectorX(length(vectorX))-vectorX(1);

for i=1:m
    sum=0;
    for k=1:terminoN
        integrandoAk=@(x) funcA(x) .* cos((2*pi*k*x)/T);
        integrandoBk=@(x) funcA(x) .* sin((2*pi*k*x)/T);
        ak(k)=(2/T)*MetodoTrapecio(integrandoAk,-(T/2),(T/2),error);
        bk(k)=(2/T)*MetodoTrapecio(integrandoBk,-(T/2),(T/2),error);
        sum= sum+(ak(k)*cos((2*pi*k*vectorX(i))/T))+(bk(k)*sin((2*pi*k*vectorX(i))/T));
    end;
    y(i)=sum + (1/T)*MetodoTrapecio(funcA,(-T/2),(T/2),error); %este es el a(0)
end;