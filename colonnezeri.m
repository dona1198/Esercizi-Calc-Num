function[B]=colonnezeri(A)
temporal = [];
B = [];
colonna = 0;
colonne = size(A, 2);
while(size(B,2) != colonne)
  max = 0;
  for j=1:(size(A,2))
    maxcol = 0;
	  for i=1:(size(A,1))
		  if( A(i,j) == 0)
        maxcol++;
      end
	  end
    if( maxcol >= max )
      max = maxcol;
      temporal = A(:,j);
      colonna = j;
    end
  end
  A(:,colonna) = [];
  B = [B temporal];
end