function[val, riga, colonna] = sottomatrice(A)
val = 0;
for i = 1:(size(A,1)-1)
	for j = 1:(size(A,2)-1)
		if(A(i, j+1)==A(i,j)+2)
			if(A(i+1,j)==A(i,j)-2)
				if(A(i+1,j+1)==A(i,j)^2)
					val=A(i,j);
					riga=i;
					colonna=j;
				end
			end
		end
	end
end
end