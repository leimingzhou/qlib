function [total_beam] = makeTotalBeam ( obj, scatterer,focal_beam, ScatCoeff,T2)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

import model.phy.PhysicalObject.OpticalTweezers.TotalBeam

n=ScatCoeff(:,1);m=ScatCoeff(:,2);a2=ScatCoeff(:,3);b2=ScatCoeff(:,4);
p=ScatCoeff(:,5);q=ScatCoeff(:,6);
%For SLSingleSphereOT
cd = T2 * [ a2; b2 ];
c = cd(1:length(cd)/2);
d = cd(length(cd)/2+1:end);
% make the totalbeam
total_beam=TotalBeam(n,m,a2,b2,p,q,c,d,scatterer,focal_beam);
end

