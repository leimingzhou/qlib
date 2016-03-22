function [total_beam] = makeTotalBeam ( obj, scatterer,focal_beam, ScatCoeff,Tcd,Tfg)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

import model.phy.PhysicalObject.LaserBeam.TotalBeamML

n=ScatCoeff(:,1);m=ScatCoeff(:,2);a2=ScatCoeff(:,3);b2=ScatCoeff(:,4);
p=ScatCoeff(:,5);q=ScatCoeff(:,6);
%For MLSingleSphereOT
[M,~,N]=size(Tcd);M=M/2;
cc=zeros(M,N);dd=zeros(M,N);ff=zeros(M,N);gg=zeros(M,N);
for jj=1:N
cd = Tcd(:,:,jj) * [ a2; b2 ];
cc(:,jj) = cd(1:length(cd)/2);
dd(:,jj) = cd(length(cd)/2+1:end);
fg = Tfg(:,:,jj) * [ a2; b2 ];
ff(:,jj) = fg(1:length(fg)/2);
gg(:,jj) = fg(length(fg)/2+1:end);
end
% make the totalbeam
total_beam=TotalBeamML(n,m,a2,b2,p,q,cc,dd,ff,gg,scatterer,focal_beam);
end

