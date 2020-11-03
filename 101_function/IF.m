function ret = IF(A, B, C)
%If A is true, then B, otherwise C.
% A must be a bool, and it could be a matrix.
% dimention of A, B, C must be te same.

% 这一步是为了保证A、B、C的维度相同
if (sum(size(B))) == 2
B = ones(size(A))*B;
end
if (sum(size(C))) == 2
C = ones(size(A))*C;
end

ret = nan(size(A));
[row,col]=find(A==1);
ret(sub2ind(size(ret), row, col)) = B(sub2ind(size(ret), row, col));
[row,col]=find(A==0);
ret(sub2ind(size(ret), row, col)) = C(sub2ind(size(ret), row, col));


