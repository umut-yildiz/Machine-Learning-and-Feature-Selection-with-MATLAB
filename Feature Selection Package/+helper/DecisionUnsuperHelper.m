classdef DecisionUnsuperHelper
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description:
%       Algorithm:
%       1. Select the feature(s) which is uncorrelated with others.
%       2. Select the best feature according to the feature selection 
%       method.
%       3. Clean the features which have high correlation between the
%       selected feature.
%       4. Turn step 2 and repeat the proccess until all features are
%       selected/cleaned.
%       5. Perform GQ Outlier Detection method and clean the featuers which
%       have no outlier.
% 
% Note:
%       - This class created in order to correlation cleaning and
%       organize feature rank.
%       - This class cannot be used by itself.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    properties (Access = private)
        PS
    end

    methods
        function obj = DecisionUnsuperHelper()
            obj.PS = feat_sel_c.metrics.PScorrelation();

        end
        function LogicalMaster = Calculator(obj,dataset,Rank)
            LogicalMaster = [];
            t = 0;
            for i = 1:2
                threshold = 0.5 + t;
                % PScorrelation
                [HighRelationship,~,NumberofHigh] = obj.PS.Calculator(dataset,threshold);

                % Define the Logical Mask in normal feature order
                LogicalMask = zeros(1,size(dataset,2));
                RankMask = Rank;

                % Correlation Selection
                CorrSelection = find(NumberofHigh==0);
                LogicalMask(:,(NumberofHigh==0)) = 1;
                LogicalMask = logical(LogicalMask);
                LM = [];
                for i = 1:size(RankMask,2)
                        for j = 1:size(CorrSelection,2)
                            if RankMask(i)==CorrSelection(j)
                                LM(i) = 1;
                            end
                        end
                end
                RankMask(LM==1) = [];

                % Select the best feature, clean the feature correlated with
                % best feature.
                while ~isempty(RankMask)
                    SelectedFeature = RankMask(1);
                    LogicalMask(:,RankMask(1)) = 1;
                    [M,~] = find(HighRelationship==SelectedFeature);
                    CorrPairsSelectedFeature = HighRelationship(M,:);
                    CorrPairsSelectedFeature = CorrPairsSelectedFeature(1:size(CorrPairsSelectedFeature,1)/2,:);
                    CorrPairsSelectedFeature = transpose(CorrPairsSelectedFeature(:,2));
                    LM = zeros(1,size(RankMask,2));
                    for i = 1:size(RankMask,2)
                        for j = 1:size(CorrPairsSelectedFeature,2)
                            if RankMask(i)==CorrPairsSelectedFeature(j)
                                LM(i) = 1;
                            end
                        end
                    end
                    LM = logical(LM);
                    RankMask(LM) = [];
                    RankMask(1) = [];
                end
                % Outlier Detection for Feature Selection
                newdataset = dataset(:,LogicalMask==1);
                GQ = feat_sel_c.metrics.OutlierDetection;
                [~,FeatureOD] = GQ.Calculator(newdataset);
                OutlierCleaning = find(FeatureOD==0);
                SelectedFeature = find(LogicalMask==1);
                OutlierCleaned = SelectedFeature(:,OutlierCleaning);
                LogicalMask(:,OutlierCleaned) = 0;

                LogicalMaster = [LogicalMaster;LogicalMask];
                t = 0.2;
                end
            
        end
        end
end
