function ret = TS_MIN(x, d)
%time-series min over the past d days.
temp = nan(size(x));

for i = d : size(x , 1)
    temp(i , :) = min(x(i-d+1:i, :));
end
ret = temp;