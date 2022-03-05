classdef ObservationCleaning
    
    properties (Access = private)
        Result        
    end
    
    methods
        function obj = ObservationCleaning()
            obj.Result = feat_sel_c.helper.MIhelper();
        end
        
        function newtrainingset = Calculator(obj,training,Result)
            % Missing Value and Infinite Value Cleaning
            MI = obj.Result.Calculator(training);
            training(:,MI) = []; % Clean data from infinite&missing values
            
            % Cleaning for Good Samples
            label = training(:,end);
            GoodSamples = training(label==0,:);
            BadSamples = training(label==1,:);

            [~,~,Observation] = feat_sel_f.OutlierDetection(GoodSamples(:,1:end-1));
            GoodSamples(Observation>0,:) = [];
            training = [GoodSamples;BadSamples];

            % Cleaning for Bad Samples
            [~,~,Observation] = feat_sel_f.OutlierDetection(training(:,1:end-1));
            BadSamples(Observation(size(GoodSamples,1)+1:size(BadSamples,1),1)==0,:) = [];
            newtrainingset = [GoodSamples;BadSamples];
        end
    end
end
