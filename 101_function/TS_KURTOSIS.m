function ret = TS_KURTOSIS(x,d)
%time-series kurtosis over past d days.
temp = NaN(size(x));

for i = d : size(temp,1)
    temp(i , :) = kurtosis(x(i-d+1 : i , :), 1 , 1);
end

ret = temp;
