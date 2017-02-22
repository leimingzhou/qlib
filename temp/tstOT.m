%This file test whether the OTm works.

%Now we try to calculate the case of core-shell sphere.
clc;
import model.phy.Solution.OTSolution.MLSingleSphereOT
import model.phy.PhysicalObject.OpticalTweezers.ForceField
sol=MLSingleSphereOT('OpticalTweezers.xml');
force=sol.perform()
%force=[-82.4893  -31.4468   47.2078];
