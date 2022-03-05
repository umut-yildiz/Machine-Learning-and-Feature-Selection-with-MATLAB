%% Dispersion Ratio
function Feature_Importance = DispersionRatio(dataset)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% !Warning! :
%       - This method can be used for RM --> [1, +infinite]
%       - Try to transformation
%
% Description:
%       - Dispersion is one of the Unsupervised methods.
%       - High RM means more relevant feature
%
% Input:
%       - dataset: NxM matrix (N:represent samples(observations), 
%       M:represent features).
%
% Output:
%       - Feature_Importance: 1xM vector, It shows rank of importance of 
%       features respectively.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[~,ncolumn] = size(dataset);
AM = mean(dataset); % Arithmetic mean
Mult = prod(dataset);
GM = Mult.^(1/ncolumn); % Geometric mean
RM = AM./GM; % Dispersion Ratio
if any(RM < 1)
    warning('This method cannot be used. See function for more information')
else
    [~,Feature_Importance] = sort(RM);
end
end
