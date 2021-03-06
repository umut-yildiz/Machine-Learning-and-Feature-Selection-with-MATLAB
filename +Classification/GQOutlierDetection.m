function [Prediction] = GQOutlierDetection(dataset)

[result] = feat_sel_f.NormalityTest(dataset); % Normality Test

% Split features normal and not normal
[~,Normal] = find(result==1);
RG = feat_sel_f.GrubbsOutlier(dataset); % Grubbs method for normal

[~,NotNormal] = find(result==0);
RQ = feat_sel_f.QuartilesOutlier(dataset); % Quartiles method 
%for not-normal

Outlier = zeros(size(RG));
Outlier(:,Normal) = RG(:,Normal);
Outlier(:,NotNormal) = RQ(:,NotNormal);

Observation = sum(Outlier,2);
Prediction = Observation>0;

end
