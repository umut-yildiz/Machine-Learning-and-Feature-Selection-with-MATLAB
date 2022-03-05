classdef SpearmanCorrelation

    properties (Access = private)
        Result 
    end

    methods
        function obj = SpearmanCorrelation()
            obj.Result = feat_sel_c.helper.MIhelper();
        end
        function [HighRelationship,CorrMatrix,NumberofHighCorr] = Calculator(obj,dataset,threshold)
            MI = obj.Result.Calculator(dataset);
            dataset(:,MI) = []; % Clean data from infinite&missing values
            
            [nrows,ncolumn] = size(dataset);

            %Compute correlation coefficient between the features
            Spmatrix = [];
            for i = 1:ncolumn
                for j = 1:ncolumn

            %Choose each features        
            F1 = dataset(:,i); 
            F2 = dataset(:,j);

            %Rank values of features
            [~,p1] = sort(F1,'ascend');
            r1 = 1:length(F1);
            r1(p1) = r1;
            r1 = transpose(r1);

            [~,p2] = sort(F2,'ascend');
            r2 = 1:length(F2);
            r2(p2) = r2;
            r2 = transpose(r2);

            %Subtract the rank of selected feature 1 and selected feature 2
            d = abs(r1-r2);

            %Compute coefficient of Spearman
            spearman = 1 - ((6*sum(d.^2))/(nrows*((nrows.^2)-1)));

            %Create correlation matrix
            sp(j,i) = 1 - ((6*sum(d.^2))/(nrows*((nrows.^2)-1)));
            Spmatrix(j,i) = [spearman];

            %Convert 1 to 0 (to able to compare coefficients)
            Spmatrix(Spmatrix==1) = 0;
                end
            end

            %Find high relationship between features
            [M,I] = find(abs(Spmatrix)>threshold);
            HighRelationship = [M,I];
            CorrMatrix = Spmatrix;
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
