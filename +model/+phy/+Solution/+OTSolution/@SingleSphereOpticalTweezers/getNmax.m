function [ Nmax] = getNmax (obj)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

lambda0 = obj.parameters.IncBeamWaveLength;
rs      = obj.parameters.SphereRadius(end);
medium_name  = obj.parameters.WorkingMedium;
n       = model.phy.data.MediumData.get_parameters(medium_name).n;
Nmax    = obj.parameters.CutOffNMax;

k       = 2*pi/lambda0*n;
Nmax1   = ceil( k*rs+4.05*(k*rs)^(1/3)+2);
Nmax    = max(Nmax,Nmax1);
obj.parameters.CutOffNMax = Nmax;

end

