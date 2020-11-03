function ret = TS_O(str_Operator_name, x ,d)
% arg str_Operator_name must be a str type.
% This is a litter tricky, better use O(x, d) insteadly.
Operator = str2func(str_Operator_name);
if d > 1
    ret = Operator(x,floor(d));
elseif  0 <= d <= 1
    ret = Operator(x,1);
else
    error('d cannot be a negtive.');
end