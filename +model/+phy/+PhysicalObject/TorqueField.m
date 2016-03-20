classdef TorqueField < model.phy.PhysicalObject.Vectorfield
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        function field = wavefunction(obj,obj1,x,y,z)
            obj1.parameters.SpherePosition=[x,y,z];
            [~,torque]=obj1.perform();
            field=torque;
        end
    end
    
end

