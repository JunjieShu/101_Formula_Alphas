function ret = TS_RANK(x, d)
%time-series rank in the past d days
% For more information of this function, refer to RANK() function

temp = nan(size(x));
for i = d : size(x , 1)
    last_rank =  RANK( x(i-d+1:i , :)' )';
    temp(i , :) = last_rank(end,:);
end

ret = temp;