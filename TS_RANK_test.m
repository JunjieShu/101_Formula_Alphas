% This script is written to see that the function TS_RANKS, it features to
% raw data, the effect, sensitivities etc. The conclusion is recoreded on
% "yin zi" document.

load trade_return.mat
OPEN = iniopen;     
CLOSE = iniclose;       
VOLUME = iniamt;    
HIGH = inihigh;   
LOW = inilow;   
RETURNS = Return;    
VWAP = CLOSE.*VOLUME./sum(VOLUME,2); 

addpath ./101_function

d = [1 5 10 15 20 25 30 40 50];
num = length(d);
% indicator = LOW(:,3);
% indicator = randn(500,1);  % 无趋势项；
 indicator = [1:500]' + 50*randn(500,1);  % 有趋势项；

for i = 1 : num
    x = TS_RANK(indicator,d(i));
    y = indicator;
    subplot(3,3,i);

    scatter( x , y, 20 ,'b');
    
    mean_value_mapped_from_d = nan(d(i),1); %记录不同d对应的indicator的平均值
    for j = 1 : d(i)
        mean_value_mapped_from_d(j) = mean(y(find(j==x)));
    end
    hold on
    plot(1 : d(i) , mean_value_mapped_from_d, 'r--*');
    title(['d=',num2str(d(i))]);
    hold off
end
suptitle('relationships between TS\_RANK() and indicator')
