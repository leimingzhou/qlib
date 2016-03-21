classdef MLSingleSphereOT  < model.phy.Solution.OTsolution.AbstractOTSolution
    %SINGLESPHEREOPTICALTWEEZERS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties

    end
    
    methods
        function obj=MLSingleSphereOT(xml_file)
            obj@model.phy.Solution.OTsolution.AbstractOTSolution(xml_file);
        end
        
        function get_parameters(obj, p)
            get_parameters@model.phy.Solution.OTsolution.AbstractOTSolution(obj, p);
            
%             obj.parameters.FocalDistance = p.get_parameter('Lens', 'FocalDistance');
%             obj.parameters.WorkingMedium = p.get_parameter('Lens', 'Medium');
%             obj.parameters.NA            = p.get_parameter('Lens', 'NA');
%             
%             obj.parameters.IncBeamCenter = p.get_parameter('IncBeam', 'Center');
%             obj.parameters.IncBeamP_L    = p.get_parameter('IncBeam', 'P_L');
%             obj.parameters.IncBeamPower  = p.get_parameter('IncBeam', 'Power');
%             obj.parameters.IncBeamPxPy   = p.get_parameter('IncBeam', 'PxPy');
%             obj.parameters.IncBeamWaist  = p.get_parameter('IncBeam', 'Waist');
%             obj.parameters.IncBeamWaveLength  = p.get_parameter('IncBeam', 'WaveLength');
            %For scatterer
            obj.parameters.SpherePosition = p.get_parameter('MultiLayerSphereScatterer', 'Position');
            obj.parameters.SphereRadius   = p.get_parameter('MultiLayerSphereScatterer', 'Radius');
            obj.parameters.SphereMedium   = p.get_parameter('MultiLayerSphereScatterer', 'Medium');
            
%             obj.parameters.CutOffNMax = p.get_parameter('CutOff', 'NMax');
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

