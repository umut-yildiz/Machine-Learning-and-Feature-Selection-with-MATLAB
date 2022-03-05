classdef PScorrelation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Note: For more information please look at function file.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    properties (Access = private)
        pearson
        spearman
        normal
    end

    methods
        function obj = PScorrelation()
            obj.pearson = feat_sel_c.metrics.PearsonCorrelation();
            obj.spearman = feat_sel_c.metrics.SpearmanCorrelation();
            obj.normal = feat_sel_c.metrics.NormalityTest();

        end
        function [HighRelationship,CorrMatrix,NumberofHighCorr] = Calculator(obj,dataset,threshold)
            [~, ncolumn] = size(dataset);

            %Pearson Correlation
            [~,p] = obj.pearson.Calculator(dataset,threshold);

            %Spearman Correlation
            [~,s] = obj.spearman.Calculator(dataset,threshold);

            % Create New Normal-NonNormal Correlation Matrix 
            LogicalMask = obj.normal.Calculator(dataset);

            [~,fnormal] = find(LogicalMask==1);
            [~,fnnormal] = find(LogicalMask==0);

            correlation = zeros(ncolumn,ncolumn);
            
            % Find true correlation coefficient for Pairs
            for i = fnormal
                for j = fnormal
                    correlation(i,j) = p(i,j);
                end
            end
            for i = fnnormal
                for j = fnnormal
                    correlation(i,j) = s(i,j);
                end
            end
            for i = 1:ncolumn
                for j = 1:ncolumn
                    if correlation(i,j) == 0
                        correlation(i,j) = s(i,j);
                    end
                end
            end

            [F1,F2] = find(abs(correlation) >threshold);
            HighRelationship = [F1,F2];
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
