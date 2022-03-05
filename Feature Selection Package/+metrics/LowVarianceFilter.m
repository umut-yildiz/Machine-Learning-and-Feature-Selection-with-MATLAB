classdef LowVarianceFilter

    properties (Access = private)
        Result
    end

    methods
        function obj = LowVarianceFilter()
            obj.Result = feat_sel_c.helper.MIhelper();
        end
        function [Rank,Score] = Calculator(obj,dataset,Result)
            MI = obj.Result.Calculator(dataset);
            dataset(:,MI) = []; % Clean data from infinite&missing values
            
            Score = var(dataset); %variance of each feature
            [~,Rank] = sort(Score,'descend');
            Score = sort(Score,'descend');

        end
    end
end
