classdef SCFS

    properties (Access = private)
        Result
    end

    methods
        function obj = SCFS()
            obj.Result = feat_sel_c.helper.MIhelper();
        end
        function [Rank,Score] = Calculator(obj,dataset,Result)
            MI = obj.Result.Calculator(dataset);
            dataset(:,MI) = []; % Clean data from infinite&missing values
            
            [nrows, ncolumn] = size(dataset);

            % Feature Discernibility
            for j = 1:nrows
                for i = 1:ncolumn
                    disi(j,i) = (dataset(j,i)-((1./nrows).*(sum(dataset(j,:)))))^2;
                end
            end
            Score = sqrt((1./(nrows-1)).*sum(disi));
            [~,Rank] = sort(Score,'descend');
            Score = sort(Score, 'descend');

        end
    end
end
