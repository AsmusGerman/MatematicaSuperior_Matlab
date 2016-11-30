function c=ReducirMatrizInterpNewton(c1,My,x,iter)
%Metodo que reduce la matriz de interpolacion de Newton
%My es la matriz triangular inferior de la interpolacion de Newton
%concatenada con el vector y.
n=length(x);
m=length(My);
if iter<=n
    c1(iter)=My(1,m);

    for i=1:length(My)-2
        My(i+1,:)=My(i+1,:)-My(1,:);
    end;
    
    for i=1:length(My)-2
            My(i+1,:)=My(i+1,:)/(x(iter+i)-x(iter));
    end;
    
    iter=iter+1;
    My=My(2:m-1,2:m);
    %Quitamos la primera fila y columna de la matriz
    
    c=ReducirMatrizInterpNewton(c1,My,x,iter);
else 
    c=c1;
end;
    
    