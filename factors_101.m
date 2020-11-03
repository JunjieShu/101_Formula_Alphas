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
%�����ݺ�������
%codeΪ46���ڻ���Լ���룬CODEΪʹ�õĳɽ�������32����Լ���룬iniamtΪ�ɽ��inicloseΪ���̼�
%dateΪ���ڣ�inihighΪ��߼ۣ�inilowΪ��ͼۣ�inioiΪ�ֲ�����iniopenΪ���̼ۣ�ReturnΪ������Լ�����棬�Ѵ�������
%�ɽ���(VOLUME)�óɽ��iniamt������


%����������������������������������������������������������������������������������������������������������������%
%���ò�����ֹʱ��
%���Է�ʽ�����������ڲ��Գ����������ٿ���������֣����Լ����������������⣩�����ձ�����>=0.8������Ե���0.5������


%%
% %%%%%%�����ڲ��ԣ���2415�����ݵ㿪ʼ����
% Start_test=2415;End_test=3600;   
% %%%%%%���������
% % Start_test=3600;End_test=length(iniclose);

%% ALPHA1 
%{

 Start_test=2415;End_test=3700;   % �����ڲ���
%   Start_test=3700;End_test=length(iniclose); % ���������
%   Start_test=2415;End_test=length(iniclose); % ���������

distribution_option = 2; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 10; %delay_var�ź�˥������
decay_var = 25; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 20; %alpha1_var���ӵĲ���

% ALPHA = RANK( ...
%     TS_ARGMAX(  SIGNEDPOWER(IF(SUM(RETURNS,20)>0, STDDEV(RETURNS,20), CLOSE),2)  ,5) , ...
%     code, ...
%     CODE)...
%     -16;

num1 = 75;
num2 = 2;
num3 = 50;

ALPHA = -RANK( TS_ARGMAX(SIGNEDPOWER(IF(SUM(RETURNS,num1)>0, STDDEV(RETURNS,num1), CLOSE), num2)  ,num3) ,code,CODE)-16;

%}
%% ALPHA2 
%{
 Start_test=2415;End_test=3700;   % �����ڲ���
%   Start_test=3700;End_test=length(iniclose); % ���������
%    Start_test=2415;End_test=length(iniclose); % ���������

distribution_option = 2; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 1; %delay_var�ź�˥������
decay_var = 5; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 5; %alpha1_var���ӵĲ���

% ALPHA = CORRELATION( RANK(DELTA(LOG(VOLUME),90)) , RANK(((CLOSE - OPEN) ./ OPEN)), 90);

 ALPHA =  CORRELATION(RANK(VOLUME,code,CODE), RANK(CLOSE./STDDEV(CLOSE,10),code,CODE), 5);
%}
%% ALPHA3 
%{
distribution_option = 2; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 1; %delay_var�ź�˥������
decay_var = 5; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 5; %alpha1_var���ӵĲ���

ALPHA = (- CORRELATION(RANK(OPEN,code,CODE), RANK(VOLUME,code,CODE), 10));
%}
%% ALPHA4
%{
distribution_option = 2; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 10; %delay_var�ź�˥������
decay_var = 25; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 20; %alpha1_var���ӵĲ���

ALPHA =  (-1 * TS_RANK(RANK(LOW, code, CODE), 20));
%}
%% ALPHA5
%{
distribution_option = 2; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 10; %delay_var�ź�˥������
decay_var = 25; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 20; %alpha1_var���ӵĲ���

ALPHA = RANK((OPEN - (SUM(VWAP, 10) ./ 10)),code,CODE) .*...
    (-1 .* ABS(RANK((CLOSE - VWAP),code,CODE)));
%}
%% ALPHA6
%{
distribution_option = 2; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 10; %delay_var�ź�˥������
decay_var = 25; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 20; %alpha1_var���ӵĲ���

ALPHA =  (-1 * CORRELATION(OPEN, VOLUME, 10));
%}
%% ALPHA7 mark!!������һ��ͨ���Ƚ�����Ȼ�����ѡ�������
%{
 Start_test=2415;End_test=3700;   % �����ڲ���
  Start_test=3700;End_test=length(iniclose); % ���������
  Start_test=2415;End_test=length(iniclose); % ���������
 
distribution_option = 2; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 1; %delay_var�ź�˥������
decay_var = 5; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 5; %alpha1_var���ӵĲ���


% ALPHA =  - IF(  (ADV_D(CLOSE,num1) < ADV_D(CLOSE,num2)) , ...
%                 ((-TS_RANK(ABS(DELTA(CLOSE, num1)), num1)) .* SIGN(DELTA(CLOSE, num1))) , ...
%                 ones(size(VOLUME))*1);

% ALPHA =  IF(  (ADV_D(CLOSE,num1) < ADV_D(CLOSE,num2)) , ...
%                 ((TS_RANK(ABS(DELTA(CLOSE, num2)), num2)) .* SIGN(DELTA(CLOSE, num2))) , ...
%                 ones(size(VOLUME))*1);

num1 = 5;   % ��һ����������Ӱ��Ƚϴ�
num2 = 25;  % ��һ����������Ӱ��Ƚϴ�

ALPHA =  SCALE(IF(  (ADV_D(CLOSE,num1) < ADV_D(CLOSE,num2)) , ...  % ����,�ʽ�����
                 -MONEYFLOW(CLOSE, VOLUME, num1)     , ...
                MONEYFLOW(CLOSE, VOLUME, num1)),1);
%}         
%% ALPHA8  
%{
% ������end_testΪ4072ʱ�������ڲ��Էǳ��ã���
% Start_test=2415;End_test=3700;   % �����ڲ���
%   Start_test=3700;End_test=length(iniclose); % ���������
Start_test=2415;End_test=length(iniclose); % ���������

distribution_option = 2; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 1; %delay_var�ź�˥������
decay_var = 5; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 5; %alpha1_var���ӵĲ���

num1 = 5;
num2 = 5;
num3 = 5; 
ALPHA =  -STDDEV( SUM(OPEN, num1) .* SUM(RETURNS, num1) -...
    DELAY(SUM(OPEN, num2) .* SUM(RETURNS, num2) , num3),...
    20);
%}
%% ALPHA9
%{
% Start_test=2415;End_test=3700;   % �����ڲ���
%   Start_test=3700;End_test=length(iniclose); % ���������
Start_test=2415;End_test=length(iniclose); % ���������

distribution_option = 1; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 1; %delay_var�ź�˥������
decay_var = 10; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 20; %alpha1_var���ӵĲ���

num1 = 1;
num2 = 5;

ALPHA = IF(...
            (0 < TS_MIN(DELTA(CLOSE, num1), num2)) , ...
            DELTA(CLOSE, num1) , ...
            IF((TS_MAX(DELTA(CLOSE, num1), num2) < 0),...
                DELTA(CLOSE, num1) ,...
                (- DELTA(CLOSE, num1)))...
           );
%}
%% ALPHA10
%{
% Start_test=2415;End_test=3700;   % �����ڲ���
%   Start_test=3700;End_test=length(iniclose); % ���������
Start_test=2415;End_test=length(iniclose); % ���������

distribution_option = 1; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 1; %delay_var�ź�˥������
decay_var = 10; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 20; %alpha1_var���ӵĲ���

% num1 = 1;
% num2 = 5;

% ALPHA = RANK(...
% IF( 0 < TS_MIN(DELTA(CLOSE, 1), 4) , ...
%     DELTA(CLOSE, 1) ,...
%     IF( TS_MAX(DELTA(CLOSE, 1), 4) < 0, ... 
%         DELTA(CLOSE, 1) , ...
%         -1 * DELTA(CLOSE, 1))...
% )...
% ,code,CODE);

%  num1 = 1;
%  num2 = 5;
% ALPHA = RANK(...
% IF( 0 < TS_MIN(DELTA(CLOSE,  num1),  num2) , ...
%     CLOSE ,...
%     IF( TS_MAX(DELTA(CLOSE,  num1),  num2) < 0, ... 
%         CLOSE, ...
%          -1*DELTA(CLOSE,  num1) )...
% )...
% ,code,CODE);
%}
%% ALPHA11
%{
 Start_test=2415;End_test=3700;   % �����ڲ���
%   Start_test=3700;End_test=length(iniclose); % ���������
   Start_test=2415;End_test=length(iniclose); % ���������
 
distribution_option = 1; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 1; %delay_var�ź�˥������
decay_var = 5; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 5; %alpha1_var���ӵĲ���

num = 30; 

ALPHA =  ( RANK(TS_MAX((VWAP - CLOSE), num),code,CODE) + RANK(TS_MIN( (VWAP - CLOSE), num),code,CODE) ) ...
    .* RANK(DELTA(VOLUME, num),code,CODE);

% ALPHA =  ( TS_RANK(TS_MAX((VWAP - CLOSE)./CLOSE, num),num) + TS_RANK(TS_MIN( (VWAP - CLOSE)./CLOSE, num),num) ) ...
%     .* TS_RANK(DELTA(VOLUME, num),num);
       %}
%% ALPHA12 alpha�����е�alpha������ʲô���������Ƕ��ۻ�����������
%{
 Start_test=2415;End_test=3700;   % �����ڲ���
%   Start_test=3700;End_test=length(iniclose); % ���������
%   Start_test=2415;End_test=length(iniclose); % ���������
 
distribution_option = 2; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 1; %delay_var�ź�˥������
decay_var = 5; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 5; %alpha1_var���ӵĲ���

num = 2; 

ALPHA =  SIGN(DELTA(VOLUME, num)) .* (-1 * DELTA(CLOSE, num));
%}
%% ALPHA13 mark ����һ��������ϵ������
%{
 Start_test=2415;End_test=3700;   % �����ڲ���
  Start_test=3700;End_test=length(iniclose); % ���������
   Start_test=2415;End_test=length(iniclose); % ���������
 
distribution_option = 2; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 1; %delay_var�ź�˥������
decay_var = 5; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 5; %alpha1_var���ӵĲ���

num1 = 1;
num2 = 5;

% ALPHA =  -1 * RANK(COVARIANCE(RANK(CLOSE), RANK(VOLUME), 5));
%     ALPHA =   COVARIANCE(RANK(CLOSE-DELAY(CLOSE,num1)), RANK(VOLUME-DELAY(VOLUME,num1)),num2); %0.71991
%     ALPHA =   COVARIANCE(TS_RANK(CLOSE-DELAY(CLOSE,num1), num2), TS_RANK(VOLUME-DELAY(VOLUME,num1),num2),num2); 
    ALPHA =   COVARIANCE(RANK(CLOSE-DELAY(CLOSE,num1)), RANK(OPEN-DELAY(OPEN,num1)),num2);
%}
%% ALPHA14
%{
 Start_test=2415;End_test=3700;   % �����ڲ���
  Start_test=3700;End_test=length(iniclose); % ���������
   Start_test=2415;End_test=length(iniclose); % ���������
 
distribution_option = 2; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 1; %delay_var�ź�˥������
decay_var = 5; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 5; %alpha1_var���ӵĲ���

num1 = 1;
num2 = 5;

% ALPHA =   RANK(RETURNS, code, CODE) .* CORRELATION(OPEN, VOLUME, 10);

%}
%% ALPHA15
%{
 Start_test=2415;End_test=3700;   % �����ڲ���
  Start_test=3700;End_test=length(iniclose); % ���������
   Start_test=2415;End_test=length(iniclose); % ���������
 
distribution_option = 2; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 1; %delay_var�ź�˥������
decay_var = 5; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 5; %alpha1_var���ӵĲ���

num1 = 1;
num2 = 5;

ALPHA =   RANK(SUM(CORRELATION(RANK(HIGH,code,CODE), RANK(VOLUME,code,CODE), 3),3),code,CODE);

%}
%% ALPHA16 mark
%{
 Start_test=2415;End_test=3700;   % �����ڲ���
%   Start_test=3700;End_test=length(iniclose); % ���������
   Start_test=2415;End_test=length(iniclose); % ���������
 
distribution_option = 2; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 1; %delay_var�ź�˥������
decay_var = 5; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 5; %alpha1_var���ӵĲ���


% ALPHA = (-1 * RANK(COVARIANCE(RANK(HIGH-LOW), RANK(VOLUME), 60)));
ALPHA =  -( RANK(COVARIANCE(RANK(ABS(HIGH-CLOSE),code,CODE), RANK(-VOLUME,code,CODE), 63))); 
%}
%% ALPHA17
%{
 Start_test=2415;End_test=3700;   % �����ڲ���
%   Start_test=3700;End_test=length(iniclose); % ���������
   Start_test=2415;End_test=length(iniclose); % ���������
 
distribution_option = 2; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 1; %delay_var�ź�˥������
decay_var = 5; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 5; %alpha1_var���ӵĲ���


% ALPHA = (-1 * RANK(COVARIANCE(RANK(HIGH-LOW), RANK(VOLUME), 60)));
ALPHA =  ((( RANK(TS_RANK(CLOSE, 10),code,CODE)) .* RANK(DELTA(DELTA(CLOSE, 1), 1),code,CODE)) .*RANK(TS_RANK((VOLUME ./ ADV_D(VOLUME,20)), 5),code,CODE)); 
%}
%% ALPHA18
%{
 Start_test=2415;End_test=3700;   % �����ڲ���
%   Start_test=3700;End_test=length(iniclose); % ���������
   Start_test=2415;End_test=length(iniclose); % ���������
 
distribution_option = 2; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 1; %delay_var�ź�˥������
decay_var = 5; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 5; %alpha1_var���ӵĲ���


% ALPHA = (-1 * RANK(COVARIANCE(RANK(HIGH-LOW), RANK(VOLUME), 60)));
% ALPHA =  - RANK(((STDDEV( CLOSE - OPEN, 5) + (CLOSE - OPEN)) + TS_RANGE(CLOSE-OPEN,10))  ,code,CODE);
ALPHA = RANK(CLOSE,code,CODE);
%}
%% ALPHA19 
%{
 Start_test=2415;End_test=3700;   % �����ڲ���
%   Start_test=3700;End_test=length(iniclose); % ���������
 Start_test=2415;End_test=length(iniclose); % ���������
 
distribution_option = 2; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 1; %delay_var�ź�˥������
decay_var = 5; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 5; %alpha1_var���ӵĲ���

ALPHA = -((-1 * SIGN(((CLOSE - DELAY(CLOSE, 7)) + DELTA(CLOSE, 7)))) .* (1 + RANK((1 + SUM(RETURNS,250)),code,CODE)));

%}
%% ALPHA20 mark!!
%{
 Start_test=2415;End_test=3700;   % �����ڲ���
%   Start_test=3700;End_test=length(iniclose); % ���������
%     Start_test=2415;End_test=length(iniclose); % ���������
 
distribution_option = 2; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 1; %delay_var�ź�˥������
decay_var = 5; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 5; %alpha1_var���ӵĲ���

ALPHA =  ((-1 * RANK((OPEN - DELAY(HIGH, 1)),code,CODE)) .* RANK((OPEN - DELAY(CLOSE, 1)),code,CODE)) .*  RANK((OPEN -DELAY(LOW, 1)),code,CODE);

%}
%% ALPHA21
%{
 Start_test=2415;End_test=3700;   % �����ڲ���
%   Start_test=3700;End_test=length(iniclose); % ���������
%     Start_test=2415;End_test=length(iniclose); % ���������
 
distribution_option = 2; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 1; %delay_var�ź�˥������
decay_var = 5; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 5; %alpha1_var���ӵĲ���


num1 = 25;
num2 = 8;
ALPHA = -IF(...
            (((SUM(CLOSE, num1) / num1) + STDDEV(CLOSE, num1)) < (SUM(CLOSE, num2) / num2)) , ...
            (-1 * 1) ,...
            IF(...
                ((SUM(CLOSE,num2) / num2) < ((SUM(CLOSE, num1) / num1) - STDDEV(CLOSE, num1))) ,...
                1 ,...
                IF(...
                    ((1 < (VOLUME ./ ADV_D(VOLUME,20))) | ((VOLUME ./ADV_D(VOLUME,20)) == 1)) , ...
                    1 , ...
                    (-1 * 1))));

%}
%% ALPHA22

 Start_test=2415;End_test=3700;   % �����ڲ���
%   Start_test=3700;End_test=length(iniclose); % ���������
%     Start_test=2415;End_test=length(iniclose); % ���������
 
distribution_option = 2; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 1; %delay_var�ź�˥������
decay_var = 5; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 5; %alpha1_var���ӵĲ���

num1 = 20;
num2 = 5;

ALPHA = 1 * (DELTA(CORRELATION(HIGH, VOLUME, num1), num1) .* RANK(STDDEV(CLOSE, num2),code,CODE));

%}
%% ALPHA40
%{
 Start_test=2415;End_test=3700;   % �����ڲ���
%   Start_test=3700;End_test=length(iniclose); % ���������
    Start_test=2415;End_test=length(iniclose); % ���������
 
distribution_option = 2; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 1; %delay_var�ź�˥������
decay_var = 5; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 5; %alpha1_var���ӵĲ���

num = 20;
num2 = 69;

ALPHA =  ((-1 * RANK(STDDEV(HIGH, 50),code,CODE)) .* CORRELATION(HIGH, VOLUME, 50));
%}
%% ALPHA43 mark
%{
 Start_test=2415;End_test=3700;   % �����ڲ���
%   Start_test=3700;End_test=length(iniclose); % ���������
    Start_test=2415;End_test=length(iniclose); % ���������
 
distribution_option = 2; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 1; %delay_var�ź�˥������
decay_var = 5; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 5; %alpha1_var���ӵĲ���

num = 20;
num2 = 69;

% ALPHA = -( TS_RANK((VOLUME ./ ADV_D(VOLUME,10)), 10) .* TS_RANK((-1 * DELTA(CLOSE, 30)), 50));
ALPHA = -( TS_RANK((VOLUME ./ ADV_D(VOLUME,10)), 10) .* TS_RANK((-1 * DELTA(CLOSE, 10)), 50));
ALPHA = -( TS_RANK((VOLUME ./ ADV_D(VOLUME,num)), num) .* TS_RANK((-1 * DELTA(CLOSE, num)), num2));
%}
%% ALPHA44
%{
 Start_test=2415;End_test=3700;   % �����ڲ���
%   Start_test=3700;End_test=length(iniclose); % ���������
    Start_test=2415;End_test=length(iniclose); % ���������
 
distribution_option = 2; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 1; %delay_var�ź�˥������
decay_var = 5; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 5; %alpha1_var���ӵĲ���

ALPHA = CORRELATION(  STDDEV( RETURNS , 5) , RETURNS ,5);
%}
%% ALPHA46
%{
 Start_test=2415;End_test=3700;   % �����ڲ���
%   Start_test=3700;End_test=length(iniclose); % ���������
     Start_test=2415;End_test=length(iniclose); % ���������
 
distribution_option = 2; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 1; %delay_var�ź�˥������
decay_var = 5; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 5; %alpha1_var���ӵĲ���

ALPHA = - IF((0.25 < (((DELAY(CLOSE, 20) - DELAY(CLOSE, 10)) / 10) - ((DELAY(CLOSE, 10) - CLOSE) / 10))) ,(-1 * 1) , IF(((((DELAY(CLOSE, 20) - DELAY(CLOSE, 10)) / 10) - ((DELAY(CLOSE, 10) - CLOSE) / 10)) < 0) , 1 ,((-1 * 1) * (CLOSE - DELAY(CLOSE, 1)))));
%}
%% ALPHA56
%{
 Start_test=2415;End_test=3700;   % �����ڲ���
%   Start_test=3700;End_test=length(iniclose); % ���������
    Start_test=2415;End_test=length(iniclose); % ���������
 
distribution_option = 1; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 1; %delay_var�ź�˥������
decay_var = 5; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 5; %alpha1_var���ӵĲ���

ALPHA = (0 - ( (RANK((SUM(RETURNS, 10) ./ SUM(SUM(RETURNS, 2), 3)),code,CODE) .* RANK((RETURNS .* VOLUME    ),code,CODE))));
%}
%% ALPHA100
%{
 Start_test=2415;End_test=3700;   % �����ڲ���
%   Start_test=3700;End_test=length(iniclose); % ���������
    Start_test=2415;End_test=length(iniclose); % ���������
 
distribution_option = 1; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 1; %delay_var�ź�˥������
decay_var = 5; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 5; %alpha1_var���ӵĲ���

ALPHA = -RANK(CORRELATION(SUM(((HIGH + LOW) / 2), 20), SUM(ADV_D(VOLUME,60), 20), 9),code,CODE) <RANK(CORRELATION(LOW, VOLUME, 6),code,CODE);
%}
%% ALPHA101
%{
 Start_test=2415;End_test=3700;   % �����ڲ���
%   Start_test=3700;End_test=length(iniclose); % ���������
    Start_test=2415;End_test=length(iniclose); % ���������
 
distribution_option = 1; %distribution_option�ǲ�λ���䷽ʽ��=1Ϊ�����Էֲ������Ʋ��ԣ�=2Ϊ���Էֲ�����վ��⣬�Գ����
delay_var = 1; %delay_var�ź�˥������
decay_var = 5; %decay_varΪ�ź��ƶ�ƽ��
alpha1_var = 5; %alpha1_var���ӵĲ���

ALPHA = RANK(STDDEV( (CLOSE - OPEN) .*(HIGH - LOW) ,10),code,CODE);
%}



CW_Martix=alphatest(Start_test,End_test, ALPHA ,code,CODE,distribution_option,delay_var,decay_var);
PATH_STR='PNL.mat';  %******ʹ��ǰ��Ҫ�޸�Ϊ�Լ���·��
resultanalyze(Start_test,End_test,delay_var,alpha1_var,CW_Martix,Return,PATH_STR)



