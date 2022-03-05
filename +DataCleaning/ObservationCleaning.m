function [newtrainset] = ObservationCleaning(training)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Note: Remove observations if have outlier in the good sample.
% Remove observations if don't have outlier in the bad sample.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cleaning for Good Samples
label = training(:,end);
GoodSamples = training(label==0,:);
BadSamples = training(label==1,:);

[~,~,Observation] = feat_sel_f.OutlierDetection(GoodSamples(:,1:end-1));
GoodSamples(Observation>0,:) = [];
training = [GoodSamples;BadSamples];

% Cleaning for Bad Samples
[~,~,Observation] = feat_sel_f.OutlierDetection(training(:,1:end-1));
BadSamples(Observation(size(GoodSamples,1)+1:size(BadSamples,1),1)==0,:) = [];
newtrainset = [GoodSamples;BadSamples];
end
