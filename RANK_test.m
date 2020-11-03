load trade_return.mat
OPEN = iniopen;     
CLOSE = iniclose;       
VOLUME = iniamt;    
HIGH = inihigh;   
LOW = inilow;   
RETURNS = Return;    
VWAP = CLOSE.*VOLUME./sum(VOLUME,2); 

addpath ./101_function

% indicator = RETURNS;
indicator = CLOSE;

hold on
for i = 1 : size(CLOSE,2)
    plot(CLOSE(:,i))
end
hold off