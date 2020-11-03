function ret = TS_SKEWNESS(x,d)
%time-series skewness over past d days.
temp = NaN(size(x));

for i = d : size(temp,1)
    temp(i , :) = skewness(x(i-d+1 : i , :), 1 , 1);
end

ret = temp;
