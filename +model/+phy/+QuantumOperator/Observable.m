classdef Observable < model.phy.QuantumOperator.AbstractQuantumOperator
    %DENSITYMATRIX Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        spin_collection
        interaction_list        
    end
    
    methods
        function obj=Observable(spin_collection, matrix_strategy)
            obj@model.phy.QuantumOperator.AbstractQuantumOperator();
            obj.spin_collection=spin_collection;
            obj.interaction_list={}; 
            
            if nargin < 2
                obj.matrix_strategy= model.phy.QuantumOperator.MatrixStrategy.FromProductSpace();
            else
                obj.matrix_strategy=matrix_strategy;
            end
            
        end
        
        function v=vector(obj)
            v=obj.matrix(:);
        end
        
    end
    
end

