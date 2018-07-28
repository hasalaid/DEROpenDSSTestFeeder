%This file is used to create the plots in the figures.
close all;

s=[1:43201];
h=s/3600+6;

figure('DefaultAxesFontSize',18)
subplot(2,3,1)
%set(gcf,'FontSize',24)
plot(h, Q_PV844,h,Q_PV890,h,Q_PV860);  % black *
title('Reactive power');
ylabel('Reactive power (kvar)');
xlabel('Time (hour)');
xlim([6 18]);
legend('Q844','Q890','Q860');

%figure('DefaultAxesFontSize',18)
%set(gcf,'FontSize',24)
subplot(2,3,2)
plot(h, P_PV844,h,P_PV890,h,P_PV860,h,P_PV890,h,P_bat);  % black *
title('Active power');
ylabel('Active power (kW)');
xlabel('Time (hour)');
xlim([6 18]);
legend('P844','P890','P860','P890','Pbat');

%figure('DefaultAxesFontSize',18)
%set(gcf,'FontSize',24)
subplot(2,3,3)
plot(h, TotalActivePower,h, TotalReactivePower);  % black *
title('Feeder total power flow');
ylabel('Apparent power (kVA) ');
xlabel('Time (hour)');
xlim([6 18]);
legend('P (kW)','Q (kvar)');



%figure('DefaultAxesFontSize',18)
%set(gcf,'FontSize',24)
subplot(2,3,4)
plot(h, V844,h,V890,h,V860,h,V812,h,V828,h,V800);  % black *
title('Bus voltage');
ylabel('Voltage (pu)');
xlabel('Time (hour)');;
xlim([6 18]);
legend('V844','V890','V860','V812','V828','V800');

%figure('DefaultAxesFontSize',18)
subplot(2,3,5)
plot(h, Regtap1,h,Regtap2);
title('Tap changer (TC) state');
xlabel('Time (hour)');
ylabel('Tap position');
ylim([-4 17]);
xlim([6 18]);
legend('TC 1 phase a','TC 2 phase a')
str = sprintf('Reg1A # of tap Ops: %d and Reg2A # of tap Ops: %d. MSE of voltage is %d. Total energy loss is %d MWh', CountTaps(Regtap1),CountTaps(Regtap2),err,energyloss);
dim = [.2 .5 .3 .5];

annotation('textbox',dim,'String',str,'FitBoxToText','on');

subplot(2,3,6)
plot(h, TotalLoss);  % black *
title('Total losses');
ylabel('Power loss (kW)')
xlabel('Time (hour)');
xlim([6 18]);
legend('Total Loss');


figure('DefaultAxesFontSize',18)
plot(h, batkWhstored);  % black *
title('State of charge');
ylabel('SOC (kWh)');
xlabel('Time (hour)');
xlim([6 18]);
legend('SOC of Battery');

