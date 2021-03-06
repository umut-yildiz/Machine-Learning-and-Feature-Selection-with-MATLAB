%% Logistic Regression
function [Rank,Score] = LogisticRegression(dataset)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description:
%       - Logistic Regression is one of the Supervised Learning Algorithms.
%       - This function finds which feature is more related with target
%       variable (effect target variable).
%       - Coefficient of Logistic Regression estimated by Stochastic 
%       Gradient Descent.
%       - This function is for only feature selection (Backward
%       Elimination).
%       - Feature importance is calculating based on their coefficient. 
%
% Input:
%       - dataset: NxM matrix (N:represent samples(observations), 
%       M:represent features).
%           + Last column must be target, target: Nx1 vector, label, 
%           should be 0,1,2,... format.
%
% Output:
%       - Feature_Importance: 1xM vector, it shows rank of importance of 
%       features respectively.
%
% Note:
%       - This function assumes that the feature which have high
%       coefficient is more important than the others (can more effect the
%       target variable).
%       - It is possible to do prediction with these coefficient.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
target = dataset(:,end);
dataset(:,end) = [];
datasetTarget = [dataset,target];
[nrows, ncolumn] = size(dataset);

for i = 1:size(datasetTarget(1,:),2)
    b(i,1) = 0.000;
end

b = transpose(b);
prediction = 1/(1+exp((-(b(1)))));
alpha = 0.3;
X = ones(nrows,1);
datasetTarget = [X,datasetTarget];
ncolumn = ncolumn+1;
y = datasetTarget(:,end);

lastprediction = [];
for l = 1:10
for h = 1:nrows

for j = 1:ncolumn
        
bnew(j) = b(j) + (alpha*(y(h)-prediction)*(prediction)*(1-prediction)*(datasetTarget(h,j)));
        
end
b = [bnew];

for i = 1:ncolumn
    if h < nrows
        a(1,i) = b(i)*datasetTarget(h+1,i);
    end
end

newprediction = 1/(1+exp((-(sum(a)))));

prediction = newprediction;
end
end

b(1) = [];
[~,Rank] =  sort(b, 'descend');
Score = abs(b);
% Score = sort(abs(Score), 'descend');

% Prediction
%B = [];
%for i = 1:ncolumn
%        B = [B ,b(i+1).*datasetTarget(:,i)];
%end
%B1 = repmat(b(1),202,1);
%B = [B1,B];
%LogModel = sum(B,2);
%unlabeledprediction = 1./(1+exp((-(LogModel))));
%logical = (unlabeledprediction>0.5);
%bar(abs(b(2:end)))
%xlabel('Feature Selection with Logistic Regression')
end
