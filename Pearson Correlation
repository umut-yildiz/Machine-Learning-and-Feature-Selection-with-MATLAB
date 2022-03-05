%% Pearson Correlation
function [HighRelationship,CorrMatrix,NumberofHighCorr] = PearsonCorrelation(dataset,threshold)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description:
%       - Pearson Correlation is a Parametric Correlation Method.
%       - This function finds correlation (relationship) between
%       features based on Pearson Correlation.
%
% Input:
%       - dataset: NxM matrix (N:represent samples(observations), 
%       M:represent features).
%
% Output:
%       - HighRelationship: Pairwise ,it means selected features have 
%       moderate and high correlation between each other.
%
% Note:
%       - Before perform this method, Normality Test must be give result
%       that all features are coming from normality distribution.
%       - In this function, threshold is 0.3.
%       - Threshold can be defined as follows:
%           + Threshold = 0.3 moderate and high correlation.
%           + Threshold = 0.5 high correlation.
%       - Positive correlation between two features means that while one of
%       features are increasing, another feature is increasing as well.
%       - Negative correlation between two features means that while one of
%       features are increasing, another feature is decreasing as well.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[~,ncolumn] = size(dataset);

correlation = corrcoef(dataset);
correlation(correlation==1) = 0; %Convert 1 to 0 (to able to compare 
%coefficients)

[M,I] = find(abs(correlation)>threshold);
HighRelationship = [M,I];
CorrMatrix = correlation;
Count = [];
for i = 1:ncolumn
    for j = 1:ncolumn
        
        Count(j,i) = CorrMatrix(j,i)>threshold;
        
    end
end
NumberofHighCorr = sum(Count);

%HighRelationship(1:2:end,:) = [];
%heatmap(correlation) %matrix map
end
