classdef GrubbsOutlier
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Note: For more information please look at function file.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    properties (Access = private)
        Result
    end

    methods
        function obj = GrubbsOutlier()
            obj.Result = feat_sel_c.helper.MIhelper();
        end
        function [Outlier,Feature,Observation] = Calculator(obj,dataset,Result)
            MI = obj.Result.Calculator(dataset);
            dataset(:,MI) = []; % Clean data from infinite&missing values
            
            [result] = feat_sel_f.NormalityTest(dataset); % Normality Test

            % Split features normal and not normal
            [~,Normal] = find(result==1);
            [RG,~,~] = feat_sel_f.GrubbsOutlier(dataset); % Grubbs method for normal

            [~,NotNormal] = find(result==0);
            [RQ,~,~] = feat_sel_f.QuartilesOutlier(dataset); % Quartiles method 
            %for not-normal

            Outlier = zeros(size(RG));
            Outlier(:,Normal) = RG(:,Normal);
            Outlier(:,NotNormal) = RQ(:,NotNormal);

            Feature = sum(Outlier);
            Observation = sum(Outlier,2);

        end
    end
end
