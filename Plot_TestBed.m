%This file screated the plots in the figures.
close all;

s=[1:43201];
h=s/3600+6;

figure('DefaultAxesFontSize',18)
subplot(2,3,1)
%set(gcf,'FontSize',24)
plot(h, Q_PV844,h,Q_PV890,h,Q_PV860);  % black *
title('Q  variation from 6am to 6pm');
ylabel('Q Kvar');
xlabel('Time (hour)');
xlim([6 18]);
legend('Q844','Q890','Q860');

%figure('DefaultAxesFontSize',18)
%set(gcf,'FontSize',24)
subplot(2,3,2)
plot(h, P_PV844,h,P_PV890,h,P_PV860,h,P_PV890,h,P_L3000,h,P_bat);  % black *
title('P  variation from 6am to 6pm');
ylabel('P kW');
xlabel('Time (hour)');
xlim([6 18]);
legend('P844','P890','P860','S890','L3000','Pbat');

%figure('DefaultAxesFontSize',18)
%set(gcf,'FontSize',24)
subplot(2,3,3)
plot(h, TotalActivePower,h, TotalReactivePower);  % black *
title('Feeder total power flow ');
ylabel('Power in kVA ');
xlabel('Time (hour)');
xlim([6 18]);
legend('P Total kW','Q Total Kvar');



%figure('DefaultAxesFontSize',18)
%set(gcf,'FontSize',24)
subplot(2,3,4)
plot(h, V844,h,V890,h,V860,h,V812,h,V828,h,V800);  % black *
title('V  variation from 6am to 6pm');
ylabel('V pu');
xlabel('Time (hour)');
xlim([6 18]);
legend('V844','V890','V860','V812','V828','V800');

%figure('DefaultAxesFontSize',18)
subplot(2,3,5)
plot(h, Regtap1,h,Regtap2);
title('Tap Changer state');
legend('Tap Changer 1 phase a','Tap Changer 2 phase a')
str = sprintf('Reg1A # of tap Ops: %d and Reg2A # of tap Ops: %d. MSE of voltage is %d. Total energy loss is %d MWh', CountTaps(Regtap1),CountTaps(Regtap2),err,energyloss);
dim = [.2 .5 .3 .5];

annotation('textbox',dim,'String',str,'FitBoxToText','on');

subplot(2,3,6)
plot(h, TotalLoss);  % black *
title('Losses');
ylabel('Total loss in  kW');
xlabel('Time (hour)');
xlim([6 18]);
legend('Total Loss');


figure('DefaultAxesFontSize',18)
plot(h, batkWhstored);  % black *
title('Current SOC');
ylabel('SOC in kWh');
xlabel('Time (hour)');
xlim([6 18]);
legend('SOC of Battery');

