%% Median Outlier Detection
function [Result] = MedianOutlier(dataset)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description:
%       - This function is one of the Outlier Detection Methods.
%       - Returns true for elements more than three scaled MAD from the 
%       median. The scaled MAD is defined as:
%           + c*median(abs(datset-median(dataset))), 
%           + where c=-1/(sqrt(2)*erfcinv(3/2)).
%
% Input:
%       - dataset: NxM matrix (N:represent samples(observations), 
%       M:represent features).
%
% Output:
%       - Result: 1x2 cell array, include two result;
%           + First array: Which observation include at least 1 outlier.
%           + Second array: The number of outliers that features have.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
threshold = 3; % Default

outliermedian = isoutlier(dataset,'median', 'ThresholdFactor', threshold);

O = sum(outliermedian,2);
[Observation,~] = find(O~=0);
Feature = sum(outliermedian);
Result = {Observation,Feature};
end
