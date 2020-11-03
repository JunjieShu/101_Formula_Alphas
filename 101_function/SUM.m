function ret = SUM(x, d)
%time-series sum over the past d days

temp = NaN(size(x));

for i = d : size(temp,1)
    temp(i , :) = nansum(x(i-d+1 : i , :));
end

ret = temp;
