classdef MediumData
    %MEDIUMDATA Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods (Static)
        function medium = get_parameters(name)
            [eM, muM]=model.phy.data.MediumData.data(name);
            medium.name=name;
            medium.eps=eM;
            medium.mu=muM;
            medium.n=sqrt(eM*muM);
            medium.v=c_velocity/medium.n;
            medium.Z=sqrt(muM/eM)*Z0;
        end
        
        function [epsilon_M, mu_M]=data(name)
            
            switch char(name)
                case 'vacuum'
                    epsilon_M = 1.0;
                    mu_M      = 1.0;
                case 'air'
                    epsilon_M = 1.000293.^2;%air in 0 degree-C, 1 atm
                    mu_M      = 1.0;
                case 'water'
                    epsilon_M = 1.3330.^2;
                case 'silica'
                    epsilon_M = 1.458.^2;% Tongcang Li's thesis P180.
                    mu_M      = 1.0;
                case 'silica_a'
                    epsilon_M = (1.458+1.0e-3*1i).^2;% For absorbtion test.
                    mu_M      = 1.0;
                case 'silica_1000dBkm'
                    epsilon_M = (1.458+1.95e-8*1i).^2;% For SiO2 with loss 1000dB/km.
                    mu_M      = 1.0;
                case 'silica_100dBkm'
                    epsilon_M = (1.458+1.95e-9*1i).^2;% For SiO2 with loss 100dB/km.
                    mu_M      = 1.0;
                case 'silica_10dBkm'
                    epsilon_M = (1.458+1.95e-10*1i).^2;% For SiO2 with loss 10dB/km.
                    mu_M      = 1.0;
                case 'silica_06dBkm'
                    epsilon_M = (1.458+1.17e-11*1i).^2;% For SiO2 with loss 0.6dB/km.
                    mu_M      = 1.0;
                case 'diamond'
                    epsilon_M = 2.418^2;% Tongcang Li's thesis P180.
                    mu_M      = 1.0;
                case 'diamond_a'
                    epsilon_M = (2.418+1e-3*1i)^2;% For absorbtion test.
                    mu_M      = 1.0;
                case 'diamond_a3'
                    epsilon_M = (2.418+1e-3*1i)^2;% For absorbtion test.
                    mu_M      = 1.0;
                case 'diamond_a4'
                    epsilon_M = (2.418+1e-4*1i)^2;% For absorbtion test.
                    mu_M      = 1.0;
                case 'diamond_a5'
                    epsilon_M = (2.418+1e-5*1i)^2;% For absorbtion test.
                    mu_M      = 1.0;
                case 'gold_6372'
                    epsilon_M = -10.85;% For absorbtion test.
                    mu_M      = 1.0;
                case 'gold_6372_a'
                    epsilon_M = -10.85+1.27*1i;% For absorbtion test.
                    mu_M      = 1.0;
                case 'virtual_metal_a'
                    epsilon_M = -1.5;% For absorbtion test.
                    mu_M      = 1.0;
                case 'ice'
                    epsilon_M = 1.31^2;% Tongcang Li's thesis P180.
                    mu_M      = 1.0;
                case 'acetone'
                    epsilon_M = 1.359^2;% Tongcang Li's thesis P180.
                    mu_M      = 1.0;
                case 'glycol'
                    epsilon_M = 1.432^2;% Tongcang Li's thesis P180.
                    mu_M      = 1.0;
                case 'polystyrene'
                    epsilon_M = 1.59^2;% Tongcang Li's thesis P180.
                    mu_M      = 1.0;
                case 'oil1.3'
                    epsilon_M = 1.3;
                    mu_M      = 1.0;
                case 'oil1.4'
                    epsilon_M = 1.4;
                    mu_M      = 1.0;
                case 'oil1.5'
                    epsilon_M = 1.5;
                    mu_M      = 1.0;
                case 'oil1.6'
                    epsilon_M = 1.6;
                    mu_M      = 1.0;
                case 'sillica'
                    epsilon_M = 1.46*1.46;
                    mu_M      = 1.0;
                otherwise
                    error([name ' - unknown medium.']);
            end
        end
    end
    
    
end

