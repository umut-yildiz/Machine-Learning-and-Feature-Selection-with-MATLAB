classdef SupervisedBoss
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation:
%       - This class is include ultimate 1 supervised filter method
%
% Input:
%       - training: NxM matrix (N:represent samples(observations), 
%       M:represent features).
%           + Last column must be target, target: Nx1 vector, label, 
%           should be 0,1,2,... format.
%
% Output:
%       - Manager: 1xM, it shows which feature should be remove
%       according to this method.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    properties (Access = private)
        FS1
    end


    methods
        function obj = SupervisedBoss()
            obj.FS1 = feat_sel_c.decision.LR_Correlation(); % LR_Corr cleaning

        end
        function Manager = Calculator(obj,training)
            % Combine all methods
            Manager = [obj.FS1.Calculator(training)];

        end
    end

end
