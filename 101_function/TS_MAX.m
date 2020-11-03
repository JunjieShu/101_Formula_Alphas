function ret = TS_MAX(x, d)
%time-series max over the past d days.
temp = nan(size(x));

for i = d : size(x , 1)
    temp(i , :) = max(x(i-d+1:i, :));
end
ret = temp;