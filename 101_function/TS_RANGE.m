function ret = TS_RANGE(x,d)
%time-series range over past d days.
temp = NaN(size(x));

for i = d : size(temp,1)
    temp(i , :) = range(x(i-d+1 : i , :),  1);
end 

ret = temp;
