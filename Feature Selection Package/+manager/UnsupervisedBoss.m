classdef UnsupervisedBoss
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Explanation:
%       - This class is include ultimate 3 unsupervised filter methods and
%       2 basic data cleaning methods.
%
% Input:
%       - dataset: NxM matrix (N:represent samples(observations), 
%       M:represent features).
%
% Output:
%       - LogicalMap: 1xM, it shows which feature should be remove
%       according to this method.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    properties (Access = private)
        FS1
        FS2
        FS3
    end
    methods
        function obj = UnsupervisedBoss()
            obj.FS1 = feat_sel_c.decision.SCFS_Correlation(); % SCFS_Corr cleaning
            obj.FS2 = feat_sel_c.decision.LVF_Correlation(); % LVF_Corr cleaning
            obj.FS3 = feat_sel_c.decision.MAD_Correlation(); % MAD_Corr cleaning
            
        end
        function Manager = Calculator(obj,dataset)
            % Combine all methods
            Manager = [obj.FS1.Calculator(dataset);obj.FS2.Calculator(dataset);obj.FS3.Calculator(dataset)];

        end
    end
end
