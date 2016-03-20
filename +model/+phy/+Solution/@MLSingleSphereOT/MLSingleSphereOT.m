classdef MLSingleSphereOT  < model.phy.Solution.AbstractSolution
    %SINGLESPHEREOPTICALTWEEZERS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties

    end
    
    methods
        function obj=MLSingleSphereOT(xml_file)
            obj@model.phy.Solution.AbstractSolution(xml_file);
        end
        
        function get_parameters(obj, p)
            get_parameters@model.phy.Solution.AbstractSolution(obj, p);
            
            obj.parameters.FocalDistance = p.get_parameter('Lens', 'FocalDistance');
            obj.parameters.WorkingMedium = p.get_parameter('Lens', 'Medium');
            obj.parameters.NA            = p.get_parameter('Lens', 'NA');
            
            obj.parameters.IncBeamCenter = p.get_parameter('IncBeam', 'Center');
            obj.parameters.IncBeamP_L    = p.get_parameter('IncBeam', 'P_L');
            obj.parameters.IncBeamPower  = p.get_parameter('IncBeam', 'Power');
            obj.parameters.IncBeamPxPy   = p.get_parameter('IncBeam', 'PxPy');
            obj.parameters.IncBeamWaist  = p.get_parameter('IncBeam', 'Waist');
            obj.parameters.IncBeamWaveLength  = p.get_parameter('IncBeam', 'WaveLength');
            
            obj.parameters.SpherePosition = p.get_parameter('MultiLayerSphereScatterer', 'Position');
%             obj.parameters.SphereNLayers  = p.get_parameter('MultiLayerSphereScatterer', 'NLayers');
            obj.parameters.SphereRadius   = p.get_parameter('MultiLayerSphereScatterer', 'Radius');
            obj.parameters.SphereMedium   = p.get_parameter('MultiLayerSphereScatterer', 'Medium');
            
            obj.parameters.CutOffNMax = p.get_parameter('CutOff', 'NMax');
        end
        
        function [force,torque,forceQ, torqueQ]=perform(obj)
%             import model.phy.PhysicalObject.Lens
                            obj.getNmax();
            lens          = obj.getLens();
            paraxial_beam = obj.getIncBeam();
            sphere        = obj.getScatterer();
            
            focal_beam    = obj.makeFocalBeam(lens, paraxial_beam);            
            [Tab, Tcd, Tfg]       = obj.getTmatrix(sphere);
            
            [total_beam,Coeff]    = obj.makeTotalBeam(sphere,focal_beam, Tab, Tcd, Tfg);
            [force,torque,forceQ, torqueQ]= obj.calForce(total_beam);
%             [obj.forcefield,obj.torquefield]=obj.getFTfield();
            
            obj.StoreKeyVariables(lens, paraxial_beam, sphere,...
                focal_beam,total_beam,Coeff,...
                force,torque,forceQ, torqueQ);
        end
            
        function field = wavefunction(obj,x,y,z)
            obj.parameters.SpherePosition=[x,y,z];
            force=obj.perform();            
            field=force;           
        end

    end
    
end

