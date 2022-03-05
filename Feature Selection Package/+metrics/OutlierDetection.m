classdef OutlierDetection  

    properties (Access = private)
        normal
        grubbs
        quartiles
    end

    methods
        function obj = OutlierDetection()

            obj.normal = feat_sel_c.metrics.NormalityTest();
            obj.grubbs = feat_sel_c.metrics.GrubbsOutlier();
            obj.quartiles = feat_sel_c.metrics.QuartilesOutlier();

        end
        function [Outlier,Feature,Observation] = Calculator(obj,dataset)
            [nrow,ncolumn] = size(dataset);
            test = dataset;
            test = reshape(test,1,nrow.*ncolumn);
            test = transpose(test);
            [result] = feat_sel_f.NormalityTest(test); % Normality Test

            if result==1

                [Outlier,~,~] = feat_sel_f.GrubbsOutlierDetection(dataset); % Grubbs method for normal

            else
                [Outlier,~,~] = feat_sel_f.QuartilesOutlierDetection(dataset); % Quartiles method 

            end

            Feature = sum(Outlier);
            Observation = sum(Outlier,2);
        end
    end
end
