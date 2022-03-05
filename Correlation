%% Pearson&Spearman Correlation
function [HighRelationship,CorrMatrix,NumberofHighCorr] = PScorrelation(dataset,threshold)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description:
%       - This function finds correlation (relationship) between features
%       based on Pearson and Spearman Correlation methods.
%       - These correlation coefficients are statistically significant.
%
% Algorithm Steps:
%
%       - First step: Function performs Pearson Correlation (parametric)
%       and Spearman Correlation (non-parametric) methods.
%       - Second step: Function performs normality test to detect which
%       features are coming normal distributed or not in dataset.
%       - Third step: Function performs Pearson Correlation for feature
%       pairs which is normality distributed, performs Spearman Correlation
%       for feature pairs which is not-normality distributed.
%       - Fourth step: Function combine results of these methods and
%       create a new correlation matrix which includes Pearson&Spearman.
%       - Fifth step: Function detect features which have moderate and high
%       correlation.
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
%       - HighRelationship: Pairwise, it means selected features have 
%       moderate and high correlation between each other.
%
% Note:
%       - In this function, threshold is 0.3.
%       - Threshold can be defined as follows:
%           + Threshold = 0.3 moderate and high correlation
%           + Threshold = 0.5 high correlation
%       - Positive correlation between two features means that while one of
%       features are increasing, another feature is increasing as well.
%       - Negative correlation between two features means that while one of
%       features are increasing, another feature is decreasing as well.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[~, ncolumn] = size(dataset);
%Pearson Correlation
[~,p,~] = feat_sel_f.PearsonCorrelation(dataset);
            
%Spearman Correlation
[~,s,~] = feat_sel_f.SpearmanCorrelation(dataset);
           
LogicalMask = feat_sel_f.NormalityTest(dataset); % Normality Test 
           
[~,fnormal] = find(LogicalMask==1); % Normal features
[~,fnnormal] = find(LogicalMask==0); % Not normal features
           
correlation = zeros(ncolumn,ncolumn); % Create PScorrelation matrix

% Find true correlation coefficient for Pairs
% Coefficients of normal feature pairs --> Pearson
for i = fnormal
    for j = fnormal
        correlation(i,j) = p(i,j);
    end
end

% Coefficients of not-normal feature pairs --> Spearman
for i = fnnormal
    for j = fnnormal
        correlation(i,j) = s(i,j);
    end
end

% Coefficients of normal&not normal feature pairs --> Spearman
for i = 1:ncolumn
    for j = 1:ncolumn
        if correlation(i,j) == 0
            correlation(i,j) = s(i,j);
        end
    end
end

[F1,F2] = find(abs(correlation) > threshold);
HighRelationship = [F1,F2];
CorrMatrix = correlation;
%HighRelationship(1:2:end,:) = [];
Count = [];
for i = 1:ncolumn
    for j = 1:ncolumn
        
        Count(j,i) = CorrMatrix(j,i)>threshold;
        
    end
end
NumberofHighCorr = sum(Count);
end
