function[L, U]=fattLU(A)
%funzione per la riduzione a scalini di una matrice
	colonna=0;
  U = A;
  L = eye(size(U,1), size(U,2));
	for riga=1:(size(U,1)-1)
    if(colonna < (size(U,2)))
      colonna=colonna+1;
      while( (colonna < (size(U,2))) && (U(riga,colonna) == 0) &&  
         (U(riga,colonna+1) == 0) &&
          (controllacolonna(U, riga+1, colonna) == 0))
            colonna=colonna+1;
      end
		  if(U(riga,colonna) == 0)
		    if(colonna != size(U,2) && U(riga,colonna + 1) != 0)
          if(controllacolonna(U, riga+1, colonna) == 0)
          %caso in cui elemento pivotale nullo, nulli tutti gli 
          %elementi sottostanti ma non subito a destra dell'elemento
          %pivotale corrente
            colonna=colonna+1;
          elseif (U(riga + 1,colonna) != 0)
          %caso in cui elemento pivotale nullo, quello subito a destra
          %dell'elemento pivotale corrente non è nullo ma l'elemento 
          %sottostante al pivot corrente non è nullo
            temp = U(riga , :);
            U(riga, :) = U(riga + 1, :);
		    	  U(riga + 1, :) = temp;
          else
          %caso in cui elemento pivotale nullo, quello subito a destra
          %dell'elemento pivotale corrente non è nullo,l'elemento 
          %sottostante al pivot corrente è nullo ma non tutti gli 
          %elementi sottostanti
            U = controllorigheinferiori(U, riga, colonna);
          end
		    else
       %caso in cui elemento pivotale nullo, quello subito a destra
       %dell'elemento pivotale corrente è anche nullo, e bisogna
       %effettuare uno switch della riga corrente con una sottostante
       %cercando il primo elemento sottostante non nullo
		      U = controllorigheinferiori(U, riga, colonna);
	     end
     end
     %riduzione a scalini
     if((riga + 1 == size(U, 1)) && (colonna == size(U, 2)))
        U(riga + 1, colonna) = 0;
     else
	   M=U(riga+1:size(U,1), 1:1);
	    x=riga+1;
	    for m=1:size(M,1)
	   	M(m)=-(U(x,colonna)/U(riga,colonna)); %calcolo moltiplicatore di Gauss
	  	  x=x+1;
	    end
      m=0;
	    for z=riga+1:size(U,1)
        m=m+1;
	    	U(z,colonna)=0;
        L(z,colonna)=-M(m);
	    end
	    m=0;
	    for a=riga+1:size(U,1)
	    	m=m+1;
	    	for b=colonna+1:size(U,2)
	  	  	U(a,b)=U(a,b)+(M(m)*U(riga,b)); %calcolo nuova riga
	  	  end
	    end
    end
   end
end