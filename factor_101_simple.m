%%
%����������������������������������������������������������������������������������������������������������������%
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

% Start_test=2415;End_test=3700;   % �����ڲ���
% Start_test=3700;End_test=length(iniclose); % ���������
Start_test=2415;End_test=length(iniclose); % ���������

    distribution_option = 2; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
    delay_var = 1; %delay_var�ź�˥������
    decay_var = 5; %decay_varΪ�ź��ƶ�ƽ��
    alpha1_var = 5; %alpha1_var���ӵĲ���
    %%
    % ���ߵ��ղ��
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
    PATH_STR='PNL.mat';  %******ʹ��ǰ��Ҫ�޸�Ϊ�Լ���·��
    resultanalyze(Start_test,End_test,delay_var,alpha1_var,CW_Martix,Return,PATH_STR)


