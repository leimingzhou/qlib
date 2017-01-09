function [ epsilon,n,k ] = epsilon_w_silica(w)
%epsilon_w_silica caculates the epsilon of silica at angular frequency w.
%   It uses the data in Palik's book and interpolation for none measured
%   data.

%This part is for debug.
        n=1.458;
        k=2.0e-9;
        epsilon=(n+1i*k).^2;
end

