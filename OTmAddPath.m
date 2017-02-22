% This file adds the OTm (qlib) and +ott package to the matlab path.
% It should be runned once when try to use OTm.
% Note: +ott should be in the current folder OTm/.

clc

fprintf('Adding the packge to Matlab Path...');
fprintf('\n');
% Add current path.
addpath(cd);
% addpath ./temp
UtilFolderName = [pwd filesep 'temp'];
addpath(UtilFolderName);
% addpath ./constant
UtilFolderName = [pwd filesep 'constant'];
addpath(UtilFolderName);
% addpath ./plotenhance
UtilFolderName = [pwd filesep 'plotenhance'];
addpath(UtilFolderName);
% addpath ./doc
UtilFolderName = [pwd filesep 'doc'];
addpath(UtilFolderName);

% % add package +ott.
% UtilFolderName = '../';
% addpath(UtilFolderName);


fprintf('Adding the packge: Completed.');
fprintf('\n');

% change to the working folder ./temp
UtilFolderName = [pwd filesep 'temp'];
cd(UtilFolderName);