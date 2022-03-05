classdef LogisticRegression
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Note: For more information please look at function file.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    properties (Access = private)
        Result
    end

    methods
        function obj = LogisticRegression()
            obj.Result = feat_sel_c.helper.MIhelper();
        end
        function [Rank,Score] = Calculator(obj,training,Result)
            target = training(:,end);
            training(:,end) = [];
            MI = obj.Result.Calculator(training);
            training(:,MI) = []; % Clean data from infinite&missing values
            
            % Clean data from infinite&missing values            
            datasetTarget = [training,target];
            [nrows, ncolumn] = size(training);

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
            Score = b;
            Score = abs(Score);
            [~,Rank] =  sort(Score, 'descend');
            Score = sort(Score, 'descend');

        end
    end
end
