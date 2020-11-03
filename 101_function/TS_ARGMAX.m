function ret = TS_ARGMAX(x,d)
%which day ts_max(x,d) occured on
temp = NaN(size(x));

for i = d : size(x , 1)
    [~ , temp(i , : )] = max(x(i-d+1 : i, : ));
end
ret = temp;