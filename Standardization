%% Standardization
function [StandardizedData] = Standardization(dataset)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description:
%      - This function tries to convert the data into standart data.
%
% Input:
%       - dataset: NxM matrix (N:represent samples(observations), 
%       M:represent features).
%
% Output:
%       - StandardizedData: NxM matrix, obtained standardized data.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[nrows,ncolumn] = size(dataset);

featuremean = mean(dataset);
featurevar = var(dataset);

%Calculate Z-score
for j = 1:ncolumn
    for i = 1:nrows
        Zscore(i,j) = (dataset(i,j)-featuremean(j))./(featurevar(j));
    end
end
StandardizedData = Zscore;
end
