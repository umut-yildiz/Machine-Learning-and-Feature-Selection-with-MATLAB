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
            obj.FS1 = feat_sel_c.decision.FS_Correlation(); % FS_Corr cleaning
            obj.FS2 = feat_sel_c.decision.IDE_Correlation(); % IDE_Corr cleaning
            obj.FS3 = feat_sel_c.decision.LR_Correlation(); % LR_Corr cleaning
            obj.FS4 = feat_sel_c.decision.PWFP_Correlation(); % PWFP_Corr cleaning
            obj.FS5 = feat_sel_c.decision.Relief_Correlation(); % Relief_Corr cleaning
            obj.FS6 = feat_sel_c.decision.LS_Correlation(); % Laplacian_Corr cleaning

        end
        function Manager = Calculator(obj,training)
            % Combine all methods
            Manager = [obj.FS1.Calculator(training);obj.FS2.Calculator(training);obj.FS3.Calculator(training);obj.FS4.Calculator(training);obj.FS5.Calculator(training);obj.FS6.Calculator(training)];

        end
    end

end
