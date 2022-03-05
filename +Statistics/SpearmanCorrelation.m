%% Spearman Correlation
% Non-Parametric (features are not normally distributed)
function [HighRelationship,CorrMatrix,NumberofHighCorr] = SpearmanCorrelation(dataset,threshold)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description:
%       - Spearman Correlation is one of the Non-Parametric Correlation
%       Methods.
%       - This function finds correlation (relationship) between
%       features based on Pearson Correlation.
%
% Input:
%       - dataset: NxM matrix (N:represent samples(observations), 
%       M:represent features).
%
% Output:
%       - HighRelationship: It means selected features have moderate and 
%       high correlation between each other.
%
% Note:
%       - Before perform this method, Normality Test can be give result
%       that all features are not coming from normality distribution.
%       - In this function, threshold is 0.3.
%       - Threshold can be defined as follows:
%           + Threshold = 0.3 moderate and high correlation
%           + Threshold = 0.5 high correlation
%       - Positive correlation between two features means that while one of
%       features are increasing, another feature is increasing as well.
%       - Negative correlation between two features means that while one of
%       features are increasing, another feature is decreasing as well.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[nrows,ncolumn] = size(dataset);

%Compute correlation coefficient between the features
Spmatrix = [];
for i = 1:ncolumn
    for j = 1:ncolumn
        
%Choose each features        
F1 = dataset(:,i); 
F2 = dataset(:,j);

%Rank values of features
[~,p1] = sort(F1,'ascend');
r1 = 1:length(F1);
r1(p1) = r1;
r1 = transpose(r1);

[~,p2] = sort(F2,'ascend');
r2 = 1:length(F2);
r2(p2) = r2;
r2 = transpose(r2);

%Subtract the rank of selected feature 1 and selected feature 2
d = abs(r1-r2);

%Compute coefficient of Spearman
spearman = 1 - ((6*sum(d.^2))/(nrows*((nrows.^2)-1)));

%Validate coefficients are statistical significient or not
%Compute the test statistic
%ttest = (spearman) * (sqrt((nrows-2)/(1-(spearman.^2))));
%Define your confidence
%80 = 1.282
%90 = 1.645
%95 = 1.960
%studentt = 1.960;
%if studentt < ttest
    %disp('Feature' + string(i))
    %disp('The correlation between selected features are statistically significant with 95% confidence');
    %disp('Feature' + string(j))
    %idx(j,i) = 1;
%else
    %idx(j,i) = 0;
%end

%Create correlation matrix
sp(j,i) = 1 - ((6*sum(d.^2))/(nrows*((nrows.^2)-1)));
Spmatrix(j,i) = [spearman];

%Convert 1 to 0 (to able to compare coefficients)
Spmatrix(Spmatrix==1) = 0;
    end
end

%Find high relationship between features
[M,I] = find(abs(Spmatrix)>threshold);
HighRelationship = [M,I];
CorrMatrix =Spmatrix;
Count = [];
for i = 1:ncolumn
    for j = 1:ncolumn
        
        Count(j,i) = CorrMatrix(j,i)>threshold;
        
    end
end
NumberofHighCorr = sum(Count);
end
