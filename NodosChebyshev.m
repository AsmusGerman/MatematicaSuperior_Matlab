function x=NodosChebyshev(cantPuntos)
for l=1:cantPuntos
    x(l)=cos(((2*l)-1)*pi/(2*cantPuntos));
end