function[s]=circolare(A)
ipotesi=[];
s=0;
x=1;
for i=1:(size(A,1)-1)
	riga=A(i+1,:);
	ipotesi = A(i,size(A,2));
	for j=1:(size(A,2)-1)
		ipotesi=[ipotesi A(i,j)];
	end
	if ipotesi==riga
		x = x+1;
	end
	if x==size(A,1)
		s=1;
	end
end