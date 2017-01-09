classdef AbstractScatterer < model.phy.PhysicalObject.PhysicalObject
    %ABSTRACTPARTICLE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        x=0
        y=0
        z=0
        scatter_medium %default SiO2.
        
%         dispersion='none';
%         w=1e14;
%         T=300;
%         epsilon=1;%dielectric constant.
    end
    
    methods
        function obj = AbstractScatterer(r_center,scatter_medium)
            obj.x=r_center(1);
            obj.y=r_center(2);
            obj.z=r_center(3);
            %             if nargin<2
            %                 scatter_medium='silica';
            %             end
            obj.scatter_medium=model.phy.data.MediumData.get_parameters(scatter_medium);
%             switch obj.dispersion
%                 case 'none'
%                     epsilon=1;
%                 case 'w'
%                     epsilon=1;% It will be changed in the main script.
% %                     n=1.458;
% %                     k=2.0e-9;
% %                     epsilon=(n+1i*k).^2;
% %                     epsilon=epslion_w(w);
%                 case 'T'
%                     disp('Disperion type not added yet!');
%                     return;
%                 otherwise
%                     disp('Invalid disperion type');
%                     return;
%             end
        end
    end
    
end

