function res  = MatrizCoeficientesLaplace(M,V0)
N = M-2;
NN = N*N;
A = eye(NN) * (-4);

res=zeros(M);
res(1,2:N+1)=V0;

for i=1:N-1
  for j=1:N
    A(i+(j-1)*N,i+(j-1)*N+1)=1;
  end;
end;

for i = 1:N
  for j = 1:N-1
    A(i+(j-1)*N,i+j*N)=1;
  end;
end;

A = A + tril((A.'),-1);
b(1:N) = V0;
b(N+1:NN) = 0;

x=A\(b.');

res(2:(N+1),2:(N+1))=transpose(reshape(x,N,N));



