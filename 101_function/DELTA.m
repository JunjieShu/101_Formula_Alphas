function ret = DELTA(x, d)
%today's value of x minus the value of x d days ago
temp = nan(size(x));
temp(d+1 : end , :) = x(d+1 : end , :) - x(1 : size(x,1) - d  , :);
ret = temp;