%% Outlier Detection
function [Outlier,Feature,Observation] = GQOutlierDetection(dataset)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description:
%       - This function is combined two outlier detection methods; Grubbs
%       (parametric) and Quartiles (non-parametric)
%       - First step: Function performs normality test to detect which
%       features are coming normal distributed or not in dataset.
%       - Second step: Function splits the features normal and not-normal.
%       - Third step: Function performs Grubbs method for the features
%       which is normal distributed, Quartiles method for the features
%       which is not normal distributed.
%       - Fourth step: Function combine results of these method.
%
% Input:
%       - dataset: NxM matrix (N:represent samples(observations), 
%       M:represent features).
%           + Last column must be target, target: Nx1 vector, label, 
%           should be 0,1,2,... format.
%           + target variable is not mandatory, if the target variable does
%           not exist, please remove line 28.
%
% Output:
%       - Feature: It shows how many outliers each feature has
%       - Observation: It shows how many outliers each observation has
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[result] = feat_sel_f.NormalityTest(dataset); % Normality Test

% Split features normal and not normal
[~,Normal] = find(result==1);
[RG,~,~] = feat_sel_f.GrubbsOutlierDetection(dataset); % Grubbs method for normal

[~,NotNormal] = find(result==0);
[RQ,~,~] = feat_sel_f.QuartilesOutlierDetection(dataset); % Quartiles method 
%for not-normal

Outlier = zeros(size(RG));
Outlier(:,Normal) = RG(:,Normal);
Outlier(:,NotNormal) = RQ(:,NotNormal);

Feature = sum(Outlier);
Observation = sum(Outlier,2);

end
