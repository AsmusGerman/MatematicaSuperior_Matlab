function Th = MetodoTrapecio(func,extremoA,extremoB,error)

h=sqrt(error);
vectorX=(extremoA:h:extremoB);
n=length(vectorX);
sum=0;
for k=2:n-1
    sum=sum+(func(vectorX(k)));
end
sum=(sum*h)+h*(func(vectorX(1))+func(vectorX(n)));

Th=sum;