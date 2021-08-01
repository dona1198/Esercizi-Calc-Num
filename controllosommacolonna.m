function[s]=controllosommacolonna(A, riga)
%data matrice e indice di riga, controllare se ogni elemento della riga
%specificata è minore della somma dei rimanenti elementi della colonna cui
%appartiene
approved = 0;
s = 0;
for(j=1:size(A,2))
  somma = 0;
  for(i=1:size(A,1))
    if(i != riga)
      somma += A(i, j);
    end
  end
  if(A(riga, j) < somma)
    approved++;
  end
end
if(approved == size(A,2))
  s = 1;
end
end