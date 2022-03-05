%% Low Variance Filter
function [Rank,Score] = LowVarianceFilter(dataset)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: 
%       - Low Variance Filter is one of the Unsupervised Filter Feature
%       Selection methods.
%       - This function helps to find which which feature has include more
%       information based on their variance. 
% 
% Input:
%       - dataset: NxM matrix (N:represent samples(observations), 
%       M:represent features).
%
% Output:
%       - Feature_Importance: 1xM vector, It shows rank of importance of 
%       features respectively.
%
% Note: 
%       - This method assume that the feature which has high variance can
%       contain more information than the others.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Score = var(dataset); %variance of each feature
[~,Rank] = sort(Score,'descend');
% Score = sort(Score,'descend');
end
