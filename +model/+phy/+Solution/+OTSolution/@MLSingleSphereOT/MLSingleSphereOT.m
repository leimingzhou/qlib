classdef MLSingleSphereOT  < model.phy.Solution.OTSolution.AbstractOTSolution
    %SINGLESPHEREOPTICALTWEEZERS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        
    end
    
    methods
        function obj=MLSingleSphereOT(xml_file)
            obj@model.phy.Solution.OTSolution.AbstractOTSolution(xml_file);
        end
        
        function get_parameters(obj, p)
            get_parameters@model.phy.Solution.OTSolution.AbstractOTSolution(obj, p);
            %For scatterer
            obj.parameters.SpherePosition = p.get_parameter('MultiLayerSphereScatterer', 'Position');
            obj.parameters.SphereRadius   = p.get_parameter('MultiLayerSphereScatterer', 'Radius');
            obj.parameters.SphereMedium   = p.get_parameter('MultiLayerSphereScatterer', 'Medium');
        end
        
        function [force,torque,forceQ, torqueQ]=perform(obj)
            obj.getNmax();
            lens          = obj.getLens();
            paraxial_beam = obj.getIncBeam();
            scatterer        = obj.getScatterer();
            
            focal_beam    = obj.makeFocalBeam(lens, paraxial_beam);
            [Tab, Tcd, Tfg]       = obj.getTmatrix(scatterer);
            [ScatCoeff,Coeff]              = obj.getScatCoeff (scatterer,focal_beam, Tab);
            [force,torque,forceQ, torqueQ] = obj.calForce(ScatCoeff);
            total_beam    = obj.makeTotalBeam(scatterer,focal_beam,ScatCoeff,Tcd, Tfg);
            
            obj.StoreKeyVariables(lens, paraxial_beam, scatterer,...
                focal_beam, total_beam, Coeff, ...
                force, torque, forceQ, torqueQ);
        end
        
        function field = wavefunction(obj,x,y,z)
            obj.parameters.SpherePosition=[x,y,z];
            force=obj.perform();
            field=force;
        end
        
    end
    
end

