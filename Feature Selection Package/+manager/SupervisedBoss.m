classdef SupervisedBoss
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation:
%       - This class is include ultimate 6 supervised filter methods and
%       2 basic data cleaning methods.
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
        FS2
        FS3
        FS4
        FS5
        FS6
    end


    methods
        function obj = SupervisedBoss()
            obj.FS3 = feat_sel_c.decision.LR_Correlation(); % LR_Corr cleaning

        end
        function Manager = Calculator(obj,training)
            % Combine all methods
            Manager = [obj.FS3.Calculator(training)];

        end
    end

end
