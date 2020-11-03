function [ret, I] = RANK(x, varargin)
% This function is not suitable for those matrix whose lots of elements are
% identical.
%ret = RANK(x) cross-sectional rank, rank by their values
% [ret, ~] = RANK(x, all_codes, filtered_codes), filter some codes
% here the second return value ~ is bool, to present the position of
% filtered_code in all_code.
% 
% for cross-section data, better using code with no NaN value.
% if variable all_codes exists, x will be filtered.

if nargin == 1
   % for debug % I = ismember(code, CODE);
    I = logical(ones(1,size(x,2)));
    ret = nan(size(x));
    temp_x = x(:,I);    
    temp_x(isnan(temp_x)) = -inf;

    [sorted_x , ~]=sort(temp_x,2);
    trans_pos = nan(size(x'));
    for i = 1 : size(x,1)
        [~,trans_pos(:,i)]=ismember(x(i,:)' , sorted_x(i,:)' ); 
    end
    
    pos = trans_pos';  

    ret(:,I) = pos(:,I);
    
    nan_num = sum(isinf(temp_x),2);
    ret = ret - nan_num;
    
    ret(isnan(x))=nan;
elseif nargin == 3
    % for debug % I = ismember(code, CODE);
    I = ismember(varargin{1}, varargin{2});
    ret = nan(size(x));
    
    temp_x = x(:,I);
    % extract filtered data;
    
    temp_x(isnan(temp_x)) = -inf;
    % regard NaN as the minimum, and they will be listed at left in the
    % sorted_x matrix; so the NaN could be easily ranked as 0
    
    % for debug %    [sorted_x , ~]=sort( x,2); 
    [sorted_x , ~]=sort(temp_x,2); % cross-sectionally rank x
    % sortOrder returns the original index of each elements in
    % matirx x in cross sectional dim (because the second arg of sort(,) is
    % set as 2.
    trans_pos = nan(size(x'));
    for i = 1 : size(x,1)
        [~,trans_pos(:,i)]=ismember(x(i,:)' , sorted_x(i,:)' ); 
    end
    
    pos = trans_pos';  
%     % "pos" returs the position of the element of x that existed in sorted_x , 
%     % by index, instead of substripts.
%     % generally, if there are several same value in sorted_x , when comparing
%     % x to sorted_x , pos will know save the first element position. But in
%     % real life data, it is rare.

    ret(:,I) = pos(:,I);
    
    nan_num = sum(isinf(temp_x),2);
    ret = ret - nan_num;
    
    ret(isnan(x))=nan;

else
    msg = 'Please input 1 or 3 variable(s).';
    error(msg)
end