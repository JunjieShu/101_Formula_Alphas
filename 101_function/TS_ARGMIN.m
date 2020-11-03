function ret = TS_ARGMIN(x,d)
%which day ts_min(x,d) occured on
temp = NaN(size(x));

for i = d : size(x , 1)
    [~ , temp(i , : )] = min(x(i-d+1 : i, : ));
end
ret = temp;