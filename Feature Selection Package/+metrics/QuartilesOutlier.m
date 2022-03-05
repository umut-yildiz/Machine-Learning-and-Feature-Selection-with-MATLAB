classdef QuartilesOutlier

    properties (Access = private)
        Result
    end

    methods
        function obj = QuartilesOutlier()
            obj.Result = feat_sel_c.helper.MIhelper();
        end
        function [Outlier,Feature,Observation] = Calculator(obj,dataset,Result)
            MI = obj.Result.Calculator(dataset);
            dataset(:,MI) = []; % Clean data from infinite&missing values
            
            threshold = 1.5; % Default
            [nrow,ncolumn] = size(dataset);
            test = dataset;
            test = reshape(test,1,nrow.*ncolumn); % convert matrix into one vector to
            % evaluate together
            outlierQuartiles = isoutlier(test,'quartiles', 'ThresholdFactor', threshold);
            Outlier = reshape(outlierQuartiles,nrow,ncolumn); % reconvert vector into matrix
            Feature = sum(Outlier);
            Observation = sum(Outlier,2);

        end
    end
end
