%————————————————————————————————————————————————————————%
%各数据含义如下
%code为46个期货合约代码，CODE为使用的成交量最大的32个合约代码，iniamt为成交额，iniclose为收盘价
%date为日期，inihigh为最高价，inilow为最低价，inioi为持仓量，iniopen为开盘价，return为各个合约日收益，已处理跳空
%————————————————————————————————————————————————————————%
%设置测试起止时间
%测试方式，先在样本内测试出满意结果，再看样本外表现（可自己划分样本内样本外）。夏普比率需>=0.8，相关性低于0.5，方可

%%%%%%样本内测试，从2415个数据点开始测试
Start_test=2415;
End_test=4072;   

%%%%%%样本外测试
% Start_test=4072;End_test=length(iniclose);

%————————————————————————————————————————————————————————%
%输入因子
%###因子1%%
% distribution_option=1; %distribution_option是仓位分配方式，=1为非中性分布，趋势策略；=2为中性分布，多空均衡，对冲策略
% delay_var=1; %delay_var信号衰减天数
% decay_var=10; %decay_var为信号移动平均
% alpha1_var=14; %alpha1_var因子的参数
% for i=Start_test:End_test %按时间循环
%     for j=1:46 %按品种循环

%     ALPHA1(i,j)=sum(Return(i-alpha1_var+1:i,j));  %******因子模块，就在这一块写因子

%     end
% end


% %###因子2
distribution_option=2; %distribution_option是仓位分配方式，=1为非中性分布，趋势策略；=2为中性分布，多空均衡，对冲策略
delay_var=1; %delay_var信号衰减天数
decay_var=20; %decay_var为信号移动平均
alpha1_var=8; %alpha1_var因子的参数
for i=Start_test:End_test  %按时间循环
    for j=1:46 %按品种循环
       
    ALPHA1(i,j)=-skewness(iniclose(i-alpha1_var+1:i,j));  %******因子模块，就在这一块写因子
   
    end
end

%————————————————————————————————————————————————————————%
CW_Martix=alphatest(Start_test,End_test,ALPHA1,code,CODE,distribution_option,delay_var,decay_var);
PATH_STR='PNL.mat';  %******使用前需要修改为自己的路径
resultanalyze(Start_test,End_test,delay_var,alpha1_var,CW_Martix,Return,PATH_STR)
