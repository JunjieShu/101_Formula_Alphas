function ret = COVARIANCE(x, y, d)
%time-serial covariance of x and y for the past d days
ret = nan(size(x));
for i = d : size(x,1)
    for j = 1 : size(x,2)
        temp = cov(x(i-d+1:i , j), y(i-d+1:i , j));
        ret(i,j) = temp(1,2);
    end
end