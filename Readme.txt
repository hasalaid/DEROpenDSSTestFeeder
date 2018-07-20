The folder provides the system with all controls activated (Fig 9 in "A Distribution System Test Feeder for DER Integration Studies" published in PSC 2018). To minimize confusion, the modified systems are not included in the shared set of files. The user can easily conduct the modifications on the code. Few examples are provided in section B I and B II.

A. How to run:

1. Change your matlab folder to the directory where the files are saved eg: C:\Dist

1b. L23 in matlab m file, change the directory to where you have now stored the opendss .dss file.

2. Run TestBed_run.m in matlab

3. All the data needed for the plot are now  in your workspace

4. Run  Plot_TestBed.m to get the plots

B. Deactivating controls and running the system for different combination of components and controllers

I. Deactivating only Tap controls (Regulator)

1. In TestBed_run.m, lines 42 to 59 defines the initialization of the fixed tap positions to 12,5,5 for Reg A and 13, 11, 12 to Reg B. Uncomment this code.

2. Run In TestBed_run.m

II. Deactivating Tap controls (Regulator),  Battry Banks, and Capacitor controllers

1. Do I

2. Deactivate Battery Bank  
 a. Comment Battery controller matlab code (lines 200 to 214)
 b. Comment !battery section in the OpenDSS file (TestBed.dss)

3. Deactivate Capacitor controller   
a.  Comment !!! Cap Control! section in the OpenDSS file (TestBed.dss)


4.Edit the Plot_TestBed.m file  
a. Edit L19 and L24  delete the graph corresponding to battery dynamics. L67 to L73, comment battery SOC plot


III. Deactivating all controls

1. Do II

2. Comment New InvControl.InvPVCtrl mode=VOLTVAR ... line in TestBed.dss

3. Run the plot file used in II