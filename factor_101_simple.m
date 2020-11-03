%%
%————————————————————————————————————————————————————————%
load trade_return.mat
OPEN = iniopen;     %plot(OPEN)
CLOSE = iniclose;       %plot(CLOSE)
VOLUME = iniamt;     %plot(VOLUME)
HIGH = inihigh;     %plot(HIGH)
LOW = inilow;     %plot(LOW)
RETURNS = Return;     %plot(RETURNS)
% VWAP = CLOSE.*VOLUME./nansum(VOLUME,2); % daily volume-weighted average price
VWAP = CLOSE;
addpath ./101_function

% Start_test=2415;End_test=3700;   % 样本内测试
% Start_test=3700;End_test=length(iniclose); % 样本外测试
Start_test=2415;End_test=length(iniclose); % 样本外测试

    distribution_option = 2; %distribution_option是仓位分配方式，=1为非中性分布，趋势策略；=2为中性分布，多空均衡，对冲策略
    delay_var = 1; %delay_var信号衰减天数
    decay_var = 5; %decay_var为信号移动平均
    alpha1_var = 5; %alpha1_var因子的参数
    %%
    % 开高低收差不多
    ALPHA = HIGH;
    ALPHA = OPEN;
    ALPHA = LOW;
    ALPHA = CLOSE;
    ALPHA = VOLUME;
    % 
    ALPHA = HIGH - LOW;
    ALPHA = CLOSE - OPEN;

    
    %%
    CW_Martix=alphatest(Start_test,End_test, ALPHA ,code,CODE,distribution_option,delay_var,decay_var);
    PATH_STR='PNL.mat';  %******使用前需要修改为自己的路径
    resultanalyze(Start_test,End_test,delay_var,alpha1_var,CW_Martix,Return,PATH_STR)


