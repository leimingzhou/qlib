classdef totalBeam < model.phy.PhysicalObject.PhysicalObject
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    % It is noticed that fobBeamS,scatBeampq,scatBeamcd are stored for
    % field calculation. Since they use the the same abNie2Lin.m functon
    % the {pq,cd} differs from Lin with order or coeffcients, though the
    % field is right.
    
    properties
        focBeamS;%focused incident beam in the sphere frame:a2,b2
        scatBeampq;%pq
%         allBeam;%all beam outside sphere:a2b2+pq
        scatBeamcd;%beam inside the sphere:cd
        nmabpqcd;%store the pure coefficents in OTT convention.
        
    end
    
    methods
        function obj=totalBeam(n,m,a2,b2,p,q,c,d,scat1,lg1)
            obj.nmabpqcd=[n,m,a2,b2,p,q,c,d];
            medium2=lg1.lens.work_medium;
            wavelength2=lg1.incBeam.wavelength/medium2.n;
            %focBeamS
            obj.focBeamS=model.phy.PhysicalObject.LaserBeam.LaserBeamPartialWave(...
                'FocusedFieldInSphereFrame',wavelength2, medium2.name);
            [ n1t,m1t,a1t,b1t ] = flatab2ab( n,m,a2,b2 );[a0t,b0t,n0t,m0t]=abNie2Lin(a1t,b1t,n1t,m1t);
            obj.focBeamS.aNNZ=[n0t,m0t,a0t];obj.focBeamS.bNNZ=[n0t,m0t,b0t];
            obj.focBeamS.AmplitudeFactor=lg1.AmplitudeFactor;%another property 'amplitude' in not updated now, attention later.
            %scatBeampq
            obj.scatBeampq=model.phy.PhysicalObject.LaserBeam.LaserBeamPartialWave(...
                'scatFieldOutsideSphere',wavelength2, medium2.name);
            [ n1t,m1t,a1t,b1t ] = flatab2ab( n,m,p,q );[a0t,b0t,n0t,m0t]=abNie2Lin(a1t,b1t,n1t,m1t);
            obj.scatBeampq.aNNZ=[n0t,m0t,a0t];obj.scatBeampq.bNNZ=[n0t,m0t,b0t];
            obj.scatBeampq.AmplitudeFactor=lg1.AmplitudeFactor;
            obj.scatBeampq.beamtype=1;
%             %allBeam
%             obj.allBeam=model.phy.PhysicalObject.LaserBeam.LaserBeamPartialWave(...
%                 'allFieldOutsideSphere',wavelength2, medium2.name);
%             [ n1t,m1t,a1t,b1t ] = flatab2ab( n,m,a2+p,b2+q );[a0t,b0t,n0t,m0t]=abNie2Lin(a1t,b1t,n1t,m1t);
%             obj.allBeam.aNNZ=[n0t,m0t,a0t];obj.allBeam.bNNZ=[n0t,m0t,b0t];
%             obj.allBeam.AmplitudeFactor=lg1.AmplitudeFactor;
%             obj.allBeam.beamtype=1;
            %scatBeamcd
            medium2=scat1.scatter_medium;
            wavelength2=lg1.incBeam.wavelength/medium2.n;            
            obj.scatBeamcd=model.phy.PhysicalObject.LaserBeam.LaserBeamPartialWave(...
                'scatFieldInSphere',wavelength2, medium2.name);
            [ n1t,m1t,a1t,b1t ] = flatab2ab( n,m,c,d );[a0t,b0t,n0t,m0t]=abNie2Lin(a1t,b1t,n1t,m1t);
            obj.scatBeamcd.aNNZ=[n0t,m0t,a0t];obj.scatBeamcd.bNNZ=[n0t,m0t,b0t];
            obj.scatBeamcd.AmplitudeFactor=lg1.AmplitudeFactor;
            
        end
    end
    
end

