function[s]=rigacolonnauguali(A)
s=0;
for i=1:(size(A,1))
	for j=1:(size(A,2))
		if( A(i,:) == A(:,j)')
      s = 1;
    end
	end
end