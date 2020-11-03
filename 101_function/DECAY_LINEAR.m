function ret = DECAY_LINEAR(x,d)
temp = nan(size(x));
for i = d : size(x,1)
    temp(i,:) = (1:d) * x(i-d+1:i , :);
    temp(i,:) = temp(i,:) ./ sum(1:d);
end
ret = temp;
