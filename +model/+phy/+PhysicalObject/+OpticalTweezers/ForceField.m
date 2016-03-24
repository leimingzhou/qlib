classdef ForceField < model.phy.PhysicalObject.VectorField
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        sol;
    end
    
    methods
        function obj=ForceField(sol)
            obj.sol=sol;
        end
        function field = wavefunction(obj,x,y,z)
            obj.sol.parameters.SpherePosition=[x,y,z];
            field=obj.sol.perform();
        end
    end
    
end

