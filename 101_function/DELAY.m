function ret = DELAY(x,d)
%DELAY(x,d) = A_{i-d}
% value of x d days ago
ret = NaN(size(x));
ret(d+1 : end , : ) = x(1 : end - d , : );