classdef SingleSphereOpticalTweezers  < model.phy.Solution.OTSolution.AbstractOTSolution
    %SINGLESPHEREOPTICALTWEEZERS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        
    end
    
    methods
        function obj=SingleSphereOpticalTweezers(xml_file)
            obj@model.phy.Solution.OTSolution.AbstractOTSolution(xml_file);
        end
        
        function get_parameters(obj, p)
            get_parameters@model.phy.Solution.OTSolution.AbstractOTSolution(obj, p);
            %For scatterer
            obj.parameters.SpherePosition  = p.get_parameter('SphereScatterer', 'Position');
            obj.parameters.SphereRadius    = p.get_parameter('SphereScatterer', 'Radius');
            obj.parameters.SphereMedium    = p.get_parameter('SphereScatterer', 'Medium');
        end
        
        function [force,torque,forceQ, torqueQ]=perform(obj)
            obj.getNmax();
            lens          = obj.getLens();
            paraxial_beam = obj.getIncBeam();
            scatterer        = obj.getScatterer();
            
            focal_beam    = obj.makeFocalBeam(lens, paraxial_beam);
            [Tab, Tcd]       = obj.getTmatrix(scatterer);
            [ScatCoeff,Coeff]              = obj.getScatCoeff (scatterer,focal_beam, Tab);
            [force,torque,forceQ, torqueQ] = obj.calForce(ScatCoeff);
            total_beam    = obj.makeTotalBeam(scatterer,focal_beam,ScatCoeff,Tcd);
            
            obj.StoreKeyVariables(lens, paraxial_beam, scatterer,...
                focal_beam,total_beam,Coeff,...
                force,torque,forceQ, torqueQ);
        end

    end
    
end

