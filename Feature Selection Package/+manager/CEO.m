classdef CEO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description:
%       - This class uses training dataset for supervised feature
%       selection, uses training and test dataset for unsupervised feature
%       selection and presents them together.
% Input:
%       - training: NxM matrix (N:represent samples(observations), 
%       M:represent features).
%           + Last column must be target, target: Nx1 vector, label, 
%           should be 0,1,2,... format.
%       - dataset: NxM matrix (N:represent samples(observations), 
%       M:represent features).
%
% Output:
%       - Final: KxM, logical matrix, it shows which feature should be 
%       selected according to all feature selection methods.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    properties (Access = private)
        S
        US
    end

    
    methods
        function obj = CEO()
            obj.S = feat_sel_c.SelectionManager.SupervisedBoss();
            obj.US = feat_sel_c.SelectionManager.UnsupervisedBoss();            
            
        end
        function Final = Calculator(obj,training,dataset)
            Super = obj.S.Calculator(training);
            Unsuper = obj.US.Calculator(dataset);
            Final = [Super;Unsuper];
            %MethodMask = [];
            %for i = 1:size(Final,1)
            %    for j = i+1:size(Final,1)
            %        if isequal(Final(i,:),Final(j,:))
            %            MethodMask(i,:) = 1;
            %        end
            %    end
            %end
            %Final(MethodMask==1,:) = [];
        end
    end
end
