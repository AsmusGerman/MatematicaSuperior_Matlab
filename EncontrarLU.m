function [L,U]=EncontrarLU(A)
n=size(A);
U=A;
I=eye(n);
L=I;
M=eye(n);
for j=1:1:n-1;
    for i=j+1:1:n
        M(i,j)=-U(i,j)/U(j,j);
        U=M*U;
        L=L*((2*I)-M);
        M(i,j)=0;
    end;
end;

