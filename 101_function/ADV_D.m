function ret = ADV_D(x, d)
%adv_d(d) or adv{d} = average daily dollar volume for the past d days
temp = nan(size(x));
for i = d : size(x,1)
    temp(i,:) = mean(x(i-d+1:i,:),1);
end
ret = temp;