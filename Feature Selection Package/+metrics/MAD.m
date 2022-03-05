classdef MAD
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Note: For more information please look at function file.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    properties (Access = private)
        Result 
    end

    methods
        function obj = MAD()
            obj.Result = feat_sel_c.helper.MIhelper();
        end
        function [Rank,Score] = Calculator(obj,dataset,Result)
            MI = obj.Result.Calculator(dataset);
            dataset(:,MI) = []; % Clean data from infinite&missing values
            
            [nrows,ncolumn] = size(dataset);

            madresult = [];
            for i = 1:ncolumn
                meandataset = mean(dataset(:,i));
                mad(i) = (sum(abs(dataset(:,i) - meandataset)))/nrows;
                madresult = [madresult, mad(i)];
            end
            [~,Rank] = sort(madresult,'descend');
            Score = sort(madresult,'descend');  

        end
        
    end
end
