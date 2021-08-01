function[V] = Vandermonde(X, n)
for i=1:size(X,1)
	p=n;
	for j=1:n+1
		V(i,j)=X(i)^p;
		p=p-1;
	end
end
end