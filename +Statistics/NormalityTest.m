%% Kolmogorov Smirnov Normality Test
function [result] = NormalityTest(dataset)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: 
%       - This function is Kolmogorov Smirnot Normality Test.
%       - Kolmogorov Smirnov is one of the Normality Tests.
%       - This function helps to decide which techniques should be
%       used. Parametric or non-parametric.
%       - Parametric Methods for normal distribution, Non-Parametric
%       Methods for otherwise must be used.
%
% Input:
%       - dataset: NxM matrix (N:represent samples(observations), 
%       M:represent features).
%
% Output: 
%       - result: 1xM vector ,0 or 1, 0 represent the feature is not 
%       normally distributed and 1 represent the feature is normally 
%       distributed.% Note:
%       - Number of observation should be greater than 30, otherwise 
%       Shapiro-Wilk Normality Test should be used.
%       - This function is useful when the values are not repeated, 
%       otherwise Cumulative should be edited.
%       - Test statistics (Dtest) is calculated for when number of samples 
%       is grater than 50, otherwise it should be changed based on 
%       Kolmogorov Smirnov Table.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[nrows, ncolumn] = size(dataset);
                        
for i = 1:ncolumn
    
    F = dataset(:,i); %describe the each feature
    F = sort(F); %sort the selected feature

    Cumulative = 1:nrows;
    Cumulative = transpose(Cumulative);

    Obs_CDF = Cumulative./nrows;

    Zscore = ((F)-(mean(F)))./(std(F));
    %Cumulative distribution of normality function
    normcum = (1./2).*(erfc(-Zscore./sqrt(2))); 

    Difference = abs(Obs_CDF-normcum);

    Dmax = max(Difference);
    Dtest = 1.35810/sqrt(nrows);

    if Dmax < Dtest
        result(i) = 1;
    else
        result(i) = 0;
    end
end
end
