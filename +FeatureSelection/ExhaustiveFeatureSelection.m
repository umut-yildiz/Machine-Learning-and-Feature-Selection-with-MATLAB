function [EFS,Accuracy] = ExhaustiveFeatureSelection(training,n)
% n --> number of feature
% Data Preparation
target = training(:,end);
dataset = training(:,1:end-1);
combination = 1:n;

for i = 1:n
    % Calculate combination from 1 to the number of features
    SelectedFeature = nchoosek(combination,i);
    
    % Choose combination and calculate prediction
    for j = 1:size(SelectedFeature,1)
        % Calculate prediction based on defined classification method
        prediction = class_f.OutlierDetection(dataset(:,SelectedFeature(j,:)));
        prediction = prediction(1:size(target,1));
        AccuracyCalculator(i,j) = sum(prediction==target)./size(target,1);
    end
end

% Find highest accuracy
Accuracy = max(AccuracyCalculator,[],'all');
[B,C] = find(Accuracy==AccuracyCalculator);

% Find combination of features which give highest accuracy
for i = 1:size(B,1)
    BestFeatures = nchoosek(combination,B(i));
    EFS{i} = {BestFeatures(C(i),:)};
end

end
