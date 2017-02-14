% Function for storing various physical constants.
% Usage: value = const(name). Supported names are:
%   c - speed of light in m/s
%   mu0 - permeability of free space, 4pix10^-7, in N/A^2
%   epsilon0 - permittivity of free space, 1 / (c^2 * mu0) in F/m
%   hbar - Plank's constant by 2pi, J/s
%   h - Plank's constant, J/s
%   e - Charge on an electron, C
%   me - mass of an electron, kg
%   kb - Boltzman's constant, J/K
%
%   Also includes various scale conversions (ie femto, tera, kilo, etc...)
function x = constant(name)
if ~ischar(name)
    error('Function const: Name of physical constant must be a string.') ;
end
switch name
    case 'lambdaNV' % by zhoulm
        x = 637.2e-9 ;
    case 'epsilonAu6372'
        x = -10.85+1.27*1i ;
    case 'epsilonAu6372_nonabsorb'
        x = -10.85+0.0*1i ;
    case 'epsilonAg6372'
        x = -14.69+1.21*1i ;
    case 'c' % ========================================================
        x = 299792458 ; %m/s from Google
    case 'mu0'% =======================================================
        x = 4 * pi * 1e-7 ;
    case 'epsilon0' % =================================================
        x = 1 / constant('c')^2 / constant('mu0') ;
    case 'hbar'
        x=1.055e-34;
    case 'h'
        x=6.626e-34;
    case 'e'
        x=1.602e-19;
    case 'me'
        x=9.109e-31;
    case 'kb'
        x=1.3806503e-23;
    case 'femto'
        x=1.0e-15;
    case 'pico'
        x=1.0e-12;
    case 'nano'
        x=1.0e-9;
    case 'micro'
        x=1.0e-6;
    case 'milli'
        x=1.0e-3;
    case 'centa'
        x=1.0e-2;
    case 'kilo'
        x=1.0e3;
    case 'mega'
        x=1.0e6;
    case 'giga'
        x=1.0e9;
    case 'tera'
        x=1.0e12;
    case 'peta'
        x=1.0e15;
    otherwise % =======================================================
        error(['Function const: Name "' name '" is not supported.']) ;
end
end