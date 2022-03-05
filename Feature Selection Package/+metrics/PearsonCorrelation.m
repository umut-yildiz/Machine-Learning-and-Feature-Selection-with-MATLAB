classdef PearsonCorrelation

    properties (Access = private)
        Result
    end

    methods
        function obj = PearsonCorrelation()
            obj.Result = feat_sel_c.helper.MIhelper();
        end
        function [HighRelationship,CorrMatrix,NumberofHighCorr] = Calculator(obj,dataset,threshold)
            [~, ncolumn] = size(dataset);
            MI = obj.Result.Calculator(dataset);
            dataset(:,MI) = []; % Clean data from infinite&missing values
            
            correlation = corrcoef(dataset);
            correlation(correlation==1) = 0; %Convert 1 to 0 (to able to compare coefficients)

            [M,I] = find(abs(correlation)>threshold);
            HighRelationship = [M,I];
            CorrMatrix = correlation;
            Count = [];
            for i = 1:ncolumn
                for j = 1:ncolumn

                    Count(j,i) = CorrMatrix(j,i)>threshold;

                end
            end
            NumberofHighCorr = sum(Count);

        end
    end
end
