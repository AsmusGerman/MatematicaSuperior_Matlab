function  R = PotencialElectricoMDF(m)
R = diag(-4*ones(m,1),0);
for i = 1:m
  for j = i:m
  if ((i>j && j==1) || (j>i && j==m))
  break;
  R(i,j) = 10;
  end;
end;
end;