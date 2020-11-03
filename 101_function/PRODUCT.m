function ret = PRODUCT(x,d)
% time-series sum over the past d days
temp = nan(size(x));
for i = d : size(x,1)
    temp(i,:) = prod(x(i-d+1:i,:),'omitnan');
end

ret = temp;