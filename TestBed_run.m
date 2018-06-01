% Examples of using Matlab to plot the voltage profile and other data https://github.com/tshort/OpenDSS/blob/master/Distrib/Examples/Matlab/MiscExamples.m
clear all;clc;close all;tic;


% execute DSSStartup.m
[DSSStartOK, DSSObj, DSSText] = DSSStartup;
DSSobj = actxserver('OpenDSSEngine.DSS');
if ~DSSobj.Start(0),
    disp('Unable to start the OpenDSS Engine')
    return
end
DSSCircuit=DSSObj.ActiveCircuit;
DSSSolution=DSSCircuit.Solution;
DSSControlQueue = DSSCircuit.CtrlQueue;
DSSCktElement = DSSCircuit.ActiveCktElement;
DSSPDElement = DSSCircuit.PDElements;
DSSMeters = DSSCircuit.Meters;
DSSBus = DSSCircuit.ActiveBus;
DSSText = DSSobj.Text;



DSSText.command='redirect (C:\Users\hdharma\Google Drive\Research\TestBed\Dist\TestBed.dss)';




DSSText.Command='Set VoltageBases = "69,24.9,4.16, .48"';
DSSText.Command='CalcVoltageBases';


DSSText.command='Set MaxControlIter=10000';
DSSText.command='set mode=daily stepsize=1s';
DSSText.Command = 'Set number=1';  % Still in Daily mode, but each Solve does one second
DSSCircuit.Solution.dblHour = 0.0;
datapoints=43201; %number of steps for 1 second resolution 43201
Vbase=24900/sqrt(3);


% % ! Force Regulator Transformer taps

% DSSText.command='Transformer.reg1a.wdg=2 Tap=(0.00625  12  * 1 +)'  % ! Tap 12
% DSSText.command='Transformer.reg1b.wdg=2 Tap=(0.00625   5 * 1 +)'  %  ! Tap 5
% DSSText.command='Transformer.reg1c.wdg=2 Tap=(0.00625   5  * 1 +)' %  ! Tap 5
% DSSText.command='Transformer.reg2a.wdg=2 Tap=(0.00625  13 * 1 +)'   % ! Tap 13
% DSSText.command='Transformer.reg2b.wdg=2 Tap=(0.00625  11 * 1 +) '  % ! Tap 11
% DSSText.command='Transformer.reg2c.wdg=2 Tap=(0.00625  12 * 1 +) '  % ! Tap 12
% DSSCircuit.RegControls.Name = ('creg1a');
% DSSCircuit.RegControls.MaxTapChange=0;
% DSSCircuit.RegControls.Name = ('creg1b');
% DSSCircuit.RegControls.MaxTapChange=0;
% DSSCircuit.RegControls.Name = ('creg1c');
% DSSCircuit.RegControls.MaxTapChange=0;
% DSSCircuit.RegControls.Name = ('creg2a');
% DSSCircuit.RegControls.MaxTapChange=0;
% DSSCircuit.RegControls.Name = ('creg2b');
% DSSCircuit.RegControls.MaxTapChange=0;
% DSSCircuit.RegControls.Name = ('creg2c');
% DSSCircuit.RegControls.MaxTapChange=0;



% we'll actually run this for 12 hrs to make a more interesting plot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:datapoints
    i
    
    
    DSSSolution.Solve;  % does one step in Daily mode
    
    myvoltagearray(:,i)=DSSCircuit.AllBusVmagpu;
    %%%%%%%%%%%%%%Bus 890
    
    DSSCircuit.RegControls.Name = ('creg1a');
    %
    Regtap1(i) = DSSCircuit.RegControls.TapNumber;
    
    
    DSSCircuit.RegControls.Name = ('creg2a');
    Regtap2(i) = DSSCircuit.RegControls.TapNumber;
    
    
    
    %%%%%%%%%%%%%%Bus 848
    DSSCircuit.SetActiveBus('844');  % arbitrary bus
    Vabc844 = DSSCircuit.ActiveBus.puVoltages;  % complex array
    Va844(i) = abs(complex(Vabc844(1), Vabc844(2)));
    Vb844(i) = abs(complex(Vabc844(3), Vabc844(4)));
    Vc844(i) = abs(complex(Vabc844(5), Vabc844(6)));
    V844(i)= (Va844(i)+Vb844(i)+Vc844(i))/3;
    
    DSSCircuit.SetActiveBus('890');  % arbitrary bus
    Vabc890 = DSSCircuit.ActiveBus.puVoltages;  % complex array
    Va890(i) = abs(complex(Vabc890(1), Vabc890(2)));
    Vb890(i) = abs(complex(Vabc890(3), Vabc890(4)));
    Vc890(i) = abs(complex(Vabc890(5), Vabc890(6)));
    V890(i)= (Va890(i)+Vb890(i)+Vc890(i))/3;
    
    DSSCircuit.SetActiveBus('860');  % arbitrary bus
    Vabc860 = DSSCircuit.ActiveBus.puVoltages;  % complex array
    Va860(i) = abs(complex(Vabc860(1), Vabc860(2)));
    Vb860(i) = abs(complex(Vabc860(3), Vabc860(4)));
    Vc860(i) = abs(complex(Vabc860(5), Vabc860(6)));
    V860(i)= (Va860(i)+Vb860(i)+Vc860(i))/3;
    
    DSSCircuit.SetActiveBus('812');  % arbitrary bus
    Vabc812 = DSSCircuit.ActiveBus.puVoltages;  % complex array
    Va812(i) = abs(complex(Vabc812(1), Vabc812(2)));
    Vb812(i) = abs(complex(Vabc812(3), Vabc812(4)));
    Vc812(i) = abs(complex(Vabc812(5), Vabc812(6)));
    V812(i)= (Va812(i)+Vb812(i)+Vc812(i))/3;
    
    
    DSSCircuit.SetActiveBus('828');  % arbitrary bus
    Vabc828 = DSSCircuit.ActiveBus.puVoltages;  % complex array
    Va828(i) = abs(complex(Vabc828(1), Vabc828(2)));
    Vb828(i) = abs(complex(Vabc828(3), Vabc828(4)));
    Vc828(i) = abs(complex(Vabc828(5), Vabc828(6)));
    V828(i)= (Va828(i)+Vb828(i)+Vc828(i))/3;
    
    DSSCircuit.SetActiveBus('800');  % arbitrary bus
    Vabc800 = DSSCircuit.ActiveBus.puVoltages;  % complex array
    Va800(i) = abs(complex(Vabc800(1), Vabc800(2)));
    Vb800(i) = abs(complex(Vabc800(3), Vabc800(4)));
    Vc800(i) = abs(complex(Vabc800(5), Vabc800(6)));
    V800(i)= (Va800(i)+Vb800(i)+Vc800(i))/3;
    
    
    DSSCircuit.SetActiveBus('806');  % arbitrary bus
    Vabc806 = DSSCircuit.ActiveBus.puVoltages;  % complex array
    Va806(i) = abs(complex(Vabc806(1), Vabc806(2)));
    Vb806(i) = abs(complex(Vabc806(3), Vabc806(4)));
    Vc806(i) = abs(complex(Vabc806(5), Vabc806(6)));
    V806(i)= (Va806(i)+Vb806(i)+Vc806(i))/3;
    
    DSSCircuit.SetActiveBus('836');  % arbitrary bus
    Vabc836 = DSSCircuit.ActiveBus.puVoltages;  % complex array
    Va836(i) = abs(complex(Vabc836(1), Vabc836(2)));
    Vb836(i) = abs(complex(Vabc836(3), Vabc836(4)));
    Vc836(i) = abs(complex(Vabc836(5), Vabc836(6)));
    V836(i)= (Va836(i)+Vb836(i)+Vc836(i))/3;
    
    DSSCircuit.SetActiveBus('812');  % arbitrary bus
    Vabc812 = DSSCircuit.ActiveBus.puVoltages;  % complex array
    Va812(i) = abs(complex(Vabc812(1), Vabc812(2)));
    Vb812(i) = abs(complex(Vabc812(3), Vabc812(4)));
    Vc812(i) = abs(complex(Vabc812(5), Vabc812(6)));
    V812(i)= (Va812(i)+Vb812(i)+Vc812(i))/3;
    
    DSSCircuit.SetActiveBus('840');  % arbitrary bus
    Vabc840 = DSSCircuit.ActiveBus.puVoltages;  % complex array
    Va840(i) = abs(complex(Vabc840(1), Vabc840(2)));
    Vb840(i) = abs(complex(Vabc840(3), Vabc840(4)));
    Vc840(i) = abs(complex(Vabc840(5), Vabc840(6)));
    V840(i)= (Va840(i)+Vb840(i)+Vc840(i))/3;
    
    DSSCircuit.SetActiveBus('848');  % arbitrary bus
    Vabc848 = DSSCircuit.ActiveBus.puVoltages;  % complex array
    Va848(i) = abs(complex(Vabc848(1), Vabc848(2)));
    Vb848(i) = abs(complex(Vabc848(3), Vabc848(4)));
    Vc848(i) = abs(complex(Vabc848(5), Vabc848(6)));
    V848(i)= (Va848(i)+Vb848(i)+Vc848(i))/3;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%Controls%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    DSSCircuit.SetActiveElement('PVSystem.PV844');
    S_PV844=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_PV844(i)=-1*(S_PV844(1)+S_PV844(3)+S_PV844(5));
    Q_PV844(i)=(S_PV844(2)+S_PV844(4)+S_PV844(6));
    
    DSSCircuit.SetActiveElement('PVSystem.PV890');
    S_PV890=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_PV890(i)=-1*(S_PV890(1)+S_PV890(3)+S_PV890(5));
    Q_PV890(i)=(S_PV890(2)+S_PV890(4)+S_PV890(6));
    S_PV890(i)=(P_PV890(i).^2+Q_PV890(i).^2).^0.5;
     
    DSSCircuit.SetActiveElement('PVSystem.PV860');
    S_PV860=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_PV860(i)=-1*(S_PV860(1)+S_PV860(3)+S_PV860(5));
    Q_PV860(i)=(S_PV860(2)+S_PV860(4)+S_PV860(6));
    
    DSSCircuit.SetActiveElement('Line.L3000');
    S_L3000=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_L3000(i)=-1*(S_L3000(1)+S_L3000(3)+S_L3000(5));
    Q_L3000(i)=(S_L3000(2)+S_L3000(4)+S_L3000(6));
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    losstemp= DSSCircuit.Losses;
    TotalLoss(i)=losstemp(1)/10^3;
    TotalActivePower(i)=DSSCircuit.TotalPower(1,1);
    TotalReactivePower(i)=DSSCircuit.TotalPower(1,2);
    
    
    DSSCircuit.Capacitors.Name='C844';
    CapState844(i,:)=(DSSCircuit.Capacitors.States)';
    DSSCircuit.Capacitors.Name='C848';
    CapState848(i,:)=(DSSCircuit.Capacitors.States)';
    
    %Battery Controls%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %if PV greater than set charge
    Batchar=500;
    if(P_PV860(i)>=Batchar+10)
        DSSText.Command = ['Storage.battery.state=CHARGING'];
    end
    if(P_PV860(i)<=Batchar-10)
        DSSText.Command = ['Storage.battery.state=DISCHARGING'];
    end
    
    DSSCircuit.SetActiveElement('Storage.battery');
    S_bat=DSSCircuit.ActiveElement.Powers; % obtained 1X8 matrix
    P_bat(i)=-1*(S_bat(1)+S_bat(3)+S_bat(5));
    Q_bat(i)=(S_bat(2)+S_bat(4)+S_bat(6));
    batkWhstored(i)=str2double(DSSCircuit.ActiveDSSElement.Properties('kWhstored').Val);
     
    if ~DSSSolution.Converged
        disp('Solution did not Converge')
    end
    
    
end

err = immse(ones(95,datapoints),myvoltagearray);
energyloss=sum(TotalLoss)/3600000; %in Mwh

toc