function ret = CORRELATION(x, y, d)
%time-serial correlation of x and y for the past d days
ret = nan(size(x));
for i = d : size(x,1)
    for j = 1 : size(x,2)
        temp = corrcoef(x(i-d+1:i , j), y(i-d+1:i , j));
        ret(i,j) = temp(1,2);
    end
end