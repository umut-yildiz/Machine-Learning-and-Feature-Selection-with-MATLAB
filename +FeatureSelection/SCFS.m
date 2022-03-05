%% SCFS Algorithm
function [Rank,Score] = SCFS(dataset)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description:
%       - Similartiy Cosinus Feature Selection is one of the Unsupervised 
%       Filter Feature Selection Methods.
%       - This function helps to find which feature has include more
%       information. 
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
%       - In this function, variance of the dataset is the most 
%       determinative statistic.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[nrows, ncolumn] = size(dataset);

% Feature Discernibility
for j = 1:nrows
    for i = 1:ncolumn
        disi(j,i) = (dataset(j,i)-((1./nrows).*(sum(dataset(j,:)))))^2;
    end
end
Score = sqrt((1./(nrows-1)).*sum(disi));
[~,Rank] = sort(Score,'descend');
% Score = sort(Score, 'descend');

end
