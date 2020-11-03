function ret = STDDEV(x,d)
%Moving time-series Standard Deviation over the past d days
% For more detailed explanation,refer to function "movstd"
ret = movstd(x, [d-1, 0], 0, 1 ,'omitnan');