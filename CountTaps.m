function [No_of_Tap_Ops] = CountTaps(Regtap)
%Regtap=Regtap1;
No_of_Tap_Ops=0;
[w,N]=size(Regtap);
for j=1:N-1
    if Regtap(j)~=Regtap(j+1)
        No_of_Tap_Ops=No_of_Tap_Ops+abs(Regtap(j)-Regtap(j+1));
    end
end
        

