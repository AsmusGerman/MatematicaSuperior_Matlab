function y = EvaluadorFourier(funcA,intervaloIzq,intervaloDer,vectorX,terminoN,error)

m = length(vectorX);
y = size(vectorX);

ak=m;
bk=m;

for i=1:m
    sum=0;
    for k=1:terminoN
        integrandoAk=@(x) funcA(x) .* cos(k*x);
        integrandoBk=@(x) funcA(x) .* sin(k*x);
        ak(k)=(1/pi)*MetodoTrapecio(integrandoAk,intervaloIzq,intervaloDer,error);
        bk(k)=(1/pi)*MetodoTrapecio(integrandoBk,intervaloIzq,intervaloDer,error);
        sum= sum+(ak(k)*cos(k*vectorX(i)))+(bk(k)*sin(k*vectorX(i)));
    end;
    y(i)=sum;
end;
% for i=1:m
%     sum =0;
%     for k=1:n
%         sum= sum+(ak(k)*cos(k*x(i)))+(bk(k)*sin(k*x(i)));
%     end;
%     y(i) = sum;
% end;