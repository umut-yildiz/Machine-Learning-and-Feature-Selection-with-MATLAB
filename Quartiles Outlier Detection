%% Quartiles Outlier Detection
function [Outlier,Feature,Observation] = QuartilesOutlierDetection(dataset)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description:
%       - This function is one of the Outlier Detection Methods.
%       - Returns true for elements more than 1.5 interquartile ranges 
%       above the upper quartile or below the lower quartile. 
%       - This method is useful when the data in dataset is not normally 
%       distributed.
%
% Input:
%       - dataset: NxM matrix (N:represent samples(observations), 
%       M:represent features).
%
% Output:
%       - Result: 1x2 cell array, include two result;
%           + First array: Which observation include at least 1 outlier.
%           + Second array: The number of outliers that features have.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
threshold = 1.5; % Default
[nrow,ncolumn] = size(dataset);
test = dataset;
test = reshape(test,1,nrow.*ncolumn); % convert matrix into one vector to
% evaluate together
outlierQuartiles = isoutlier(test,'quartiles', 'ThresholdFactor', threshold);
Outlier = reshape(outlierQuartiles,nrow,ncolumn); % reconvert vector into matrix
Feature = sum(Outlier);
Observation = sum(Outlier,2);

end
