classdef OMC < MC
    %OMC Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        flag;
        createTime;
        minWeight;
    end
    
    methods
        function obj = OMC()
            obj.flag = 0;
        end
        function obj = Calculate_W(obj,PARA,time)
            temp_1 = (1 / power(2,PARA.LAMBDA*(time - obj.createTime + PARA.T))) - 1;
            temp_2 = (1 / power(2,PARA.LAMBDA*PARA.T)) - 1;
            obj.minWeight = temp_1 / temp_2;
        end
    end
    
end