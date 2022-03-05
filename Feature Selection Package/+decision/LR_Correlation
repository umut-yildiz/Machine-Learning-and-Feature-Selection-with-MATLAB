classdef LR_Correlation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description:
%       - Logistic Regression with Correlation Cleaning.
% 
% Input:
%       - dataset: NxM matrix (N:represent samples(observations), 
%       M:represent features).
%           + Last column must be target, target: Nx1 vector, label, 
%           should be 0,1,2,... format.
%
% Output:
%       - LogicalMap: 1xM, it shows which feature should be remove
%       according to this method.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    properties (Access = private)
        LR
        DecisionHelp
        ObservationC
    end

    methods
        function obj = LR_Correlation()
            % Logistic Regression
            obj.LR = feat_sel_c.metrics.LogisticRegression();
            obj.DecisionHelp = feat_sel_c.helper.DecisionSuperHelper();
            obj.ObservationC = feat_sel_c.metrics.ObservationCleaning();

        end
        function LogicalMask = Calculator(obj,training)
            training = obj.ObservationC.Calculator(training);
            [Rank,~] = obj.LR.Calculator(training);
            % Decision Manager
            LogicalMask = obj.DecisionHelp.Calculator(training, Rank);

        end
    end
end
