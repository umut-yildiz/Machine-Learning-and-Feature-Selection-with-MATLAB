classdef NormalityTest

    properties (Access = private)
        Result
    end

    methods
        function obj = NormalityTest()
            obj.Result = feat_sel_c.helper.MIhelper();
        end
        function Result = Calculator(obj,dataset,Result)
            
            MI = obj.Result.Calculator(dataset);
            dataset(:,MI) = []; % Clean data from infinite&missing values
            
            [nrows, ncolumn] = size(dataset);
                        
            for i = 1:ncolumn

                F = dataset(:,i); %describe the each feature
                F = sort(F); %sort the selected feature

                Cumulative = 1:nrows;
                Cumulative = transpose(Cumulative);

                Obs_CDF = Cumulative./nrows;

                Zscore = ((F)-(mean(F)))./(std(F));
                %Cumulative distribution of normality function
                normcum = (1./2).*(erfc(-Zscore./sqrt(2))); 

                Difference = abs(Obs_CDF-normcum);

                Dmax = max(Difference);
                Dtest = 1.35810/sqrt(nrows);

                if Dmax < Dtest
                    Result(i) = 1;
                else
                    Result(i) = 0;
                end

            end
        end
    end
end
