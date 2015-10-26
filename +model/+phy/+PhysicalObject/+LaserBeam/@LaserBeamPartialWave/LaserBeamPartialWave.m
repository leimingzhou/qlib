classdef LaserBeamPartialWave < model.phy.PhysicalObject.PhysicalObject
    %LASERBEAM Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        k
        medium
        wavelength
        
        amplitude_factor
        
        aNNZ
        bNNZ
    end
    
    
    methods
        function obj=LaserBeamPartialWave(name, wavelength, medium_name)
            if nargin < 3
                medium_name = 'air';
            end
            obj.medium=model.phy.data.MediumData.get_parameters(medium_name);
            
            obj.name=name;
            obj.wavelength=wavelength;      %wavelength in medium
            obj.k=2.0*pi/wavelength;        %wave number in medium
        end
                
        function setAmplitude(obj, amp)
            obj.amplitude_factor=amp;
        end
        
        function [eField, hField]=wavefunction(obj, x, y, z)
            import model.phy.PhysicalObject.LaserBeam.assist.gammaMN
            import model.math.misc.Cart2Sph

            eField=zeros(1, 3); hField=zeros(1, 3);
            [r, theta, phi]=Cart2Sph(x, y, z);
            kr=obj.k*r;
            if kr==0
                kr=eps;
            end

            Z=obj.medium.Z;
            for kk=1:length(obj.aNNZ)
                aTerm=obj.aNNZ(kk,:);
                n=aTerm(1); m=aTerm(2); amn=aTerm(3);

                prefact = (1.j)^(n-1)* sqrt(4.0*pi);% See Doc: VSWF.m
                [M_mode, N_mode] = ott13.vswfcart(n,m,kr,theta,phi,3);
                eField=eField+ amn* prefact *N_mode;
                hField=hField+ amn* prefact *M_mode / (1.j*Z);
            end

            for kk=1:length(obj.bNNZ)
                bTerm=obj.bNNZ(kk,:);
                n=bTerm(1);  m=bTerm(2); bmn=bTerm(3);
                prefact = (1.j)^(n-1)* sqrt(4.0*pi);% See Doc: VSWF.m
                [M_mode,~] = ott13.vswfcart(n,m,kr,theta,phi,3);
                eField=eField+ bmn* prefact *M_mode;
                hField=hField+ bmn* prefact *N_mode / (1.j*Z);
            end
            eField=eField*obj.amplitude_factor;
            hField=hField*obj.amplitude_factor;
        end
                
    end
end
