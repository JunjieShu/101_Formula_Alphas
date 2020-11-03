function ret = SCALE(x,dim)
if dim == 2
    ret = x./  nansum(abs(x),2);
elseif dim == 1
    ret = x./  nansum(abs(x),1);
end

