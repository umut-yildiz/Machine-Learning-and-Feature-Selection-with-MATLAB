classdef MAD_Correlation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description:
%       - Mean Absolute Difference with Correlation Cleaning.
% 
% Input:
%       - dataset: NxM matrix (N:represent samples(observations), 
%       M:represent features).
%           + Last column must be target, target: Nx1 vector, label, 
%           should be 0,1,2,... format.
%           + target variable is not mandatory. If target variable is not
%           exist, please get into metric and remove this 
%           "dataset(:,end) = []"
%
% Output:
%       - LogicalMap: 1xM, it shows which feature should be remove
%       according to this method.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    properties (Access = private)
        MeanAD
        DecisionHelp
    end

    methods
        function obj = MAD_Correlation()
            % Mean Absolute Difference
            obj.MeanAD = feat_sel_c.metrics.MAD();   
            obj.DecisionHelp = feat_sel_c.helper.DecisionUnsuperHelper();

        end
        function LogicalMask = Calculator(obj,dataset)
            [Rank,~] = obj.MeanAD.Calculator(dataset);          
            % Decision Manager
            LogicalMask = obj.DecisionHelp.Calculator(dataset, Rank);

        end
    end
end
