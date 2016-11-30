function y=EvaluadorDeNewton2(x,c,xe)
n=length(x);
% m=length(xe);
for i=0:n
    if i>0
        r(i+1)=c(i+1)*Prod(x(1:i),xe);
    else
        r(1)=c(1);
    end
end
for i=1:n-1
    y=r(i)+r(i+1);
end

function y = Prod(x,xe)
n=length(x);
y(n)=xe-x(n);
if(n>1)
    y(1:n-1)=Prod(x(1:n-1),xe)*y(n);
end