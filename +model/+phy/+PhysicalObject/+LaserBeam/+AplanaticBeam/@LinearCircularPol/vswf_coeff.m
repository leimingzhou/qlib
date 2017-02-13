function [ pmn, qmn ] = vswf_coeff( obj, m, n, Qa, cosA, wList )
%VSWF_COEFF Summary of this function goes here
%   Detailed explanation goes here
%   This vswf_coeff calculate Eq(50) and Eq.(52) in note.
px=obj.incBeam.px; py=obj.incBeam.py;
if (px==2 && py==0 && obj.incBeam.l==1)% Radial polarized:pl=[p,1]
    if m~=0
        pmn=0.0; qmn=0.0;
    else
%         import model.phy.PhysicalObject.LaserBeam.assist.gammaMN
        import model.phy.PhysicalObject.LaserBeam.assist.pi_tauMN
        prefactor= sqrt((2*n+1)/n/(n+1));
        [~, tau_mn]=pi_tauMN(m, n, cosA);     
%         px=obj.incBeam.px; py=obj.incBeam.py;
            pmn = prefactor*sum(wList.*Qa.*tau_mn);
            qmn = 0.0;
    end
elseif (px==0 && py==2 && obj.incBeam.l==1)% azimuthal polarized
%     error('Azimuthal polarization has not been finished');
    if m~=0
        pmn=0.0; qmn=0.0;
    else
%         import model.phy.PhysicalObject.LaserBeam.assist.gammaMN
        import model.phy.PhysicalObject.LaserBeam.assist.pi_tauMN
        prefactor= sqrt((2*n+1)/n/(n+1));
        [~, tau_mn]=pi_tauMN(m, n, cosA);     
%         px=obj.incBeam.px; py=obj.incBeam.py;
            pmn = 0.0;
            qmn = prefactor*sum(wList.*Qa.*tau_mn)*(-1i);
            
    end
else
    if m~=(obj.incBeam.l+1) && m~=(obj.incBeam.l-1)
        pmn=0.0; qmn=0.0;
    else
        import model.phy.PhysicalObject.LaserBeam.assist.gammaMN
        import model.phy.PhysicalObject.LaserBeam.assist.pi_tauMN
        
        
        prefactor=0.5 * sqrt( gammaMN(m,n) );
        [pi_mn, tau_mn]=pi_tauMN(m, n, cosA);
        
        px=obj.incBeam.px; py=obj.incBeam.py;
        if m==(obj.incBeam.l+1)
            pmn = prefactor*( px-1.j*py)*sum(wList.*Qa.*(pi_mn+tau_mn));
            qmn = pmn;
        else %m==obj.l-1
            pmn = prefactor*(-px-1.j*py)*sum(wList.*Qa.*(pi_mn-tau_mn));
            qmn = -pmn;
        end
        
        
    end
end
end

