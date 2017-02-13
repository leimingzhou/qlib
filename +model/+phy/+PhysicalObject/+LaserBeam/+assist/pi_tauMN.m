function [piMN, tauMN] = pi_tauMN( m, n, cosA )
%PIMN Summary of this function goes here
%   Detailed explanation goes here
    import model.phy.PhysicalObject.LaserBeam.assist.legendrePmn
    
    sinA=sqrt(1-cosA.*cosA);
    lgdMN_sinA =legendrePmn(m, n, cosA)./sinA;
    lgdMN_sinA =lgdMN_sinA/(-1)^m;%Lin's defination of lgd function omited (-1)^m;
    lgdMN1_sinA=legendrePmn(m, n+1, cosA)./sinA;
    lgdMN1_sinA=lgdMN1_sinA/(-1)^m;
    
    piMN = m * lgdMN_sinA;
    tauMN= -(n+1)*cosA.*lgdMN_sinA + (n-m+1)*lgdMN1_sinA;
end

