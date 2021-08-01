function[A] = contatoreelem(X)
A = [X(1), 1];
for i=2:size(X,1)
  justinsert = 0;
  j = 1;
  while (justinsert==0)
    if(A(j, 1) == X(i))
      A(j, 2) = A(j, 2) + 1;
      justinsert = 1;
    end
    if(j == size(A,1))
      A = [A; [X(i), 1]];
      justinsert = 1;
    end
    j++;
  endwhile
end
A=sortrows(A);
end