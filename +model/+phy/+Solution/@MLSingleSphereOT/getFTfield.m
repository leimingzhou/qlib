function [forcefield,torquefield]=getFTfield(obj)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

   import model.phy.PhysicalObject.ForceField
   import model.phy.PhysicalObject.TorqueField
   
   forcefield  = ForceField(obj);
   torquefield = TorqueField(obj);

end

