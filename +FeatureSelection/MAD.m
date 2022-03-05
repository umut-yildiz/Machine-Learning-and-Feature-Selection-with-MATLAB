%% Mean Absolute Difference
function [Rank,Score] = MAD(dataset)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description:
%       - Mean Absolute Difference is one of the Unsupervised Filter
%       Feature Selection Methods.
%       - This function helps to find which which feature has include more
%       information based on their mean absolute difference.
%
% Input:
%       - dataset: NxM matrix (N:represent samples(observations), 
%       M:represent features).
%
% Output:
%       - Feature_Importance: 1xM vector, It shows rank of importance of 
%       features respectively.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[nrows,ncolumn] = size(dataset);
mad = [];
for i = 1:ncolumn
    meandataset = mean(dataset(:,i));
    mad(i) = (sum(abs(dataset(:,i) - meandataset)))/nrows;
end
[~,Rank] = sort(mad,'descend');
Score = mad;
% Score = sort(mad,'descend');
end
