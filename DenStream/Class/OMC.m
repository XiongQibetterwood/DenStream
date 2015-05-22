classdef OMC < MC
    %OMC Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Access = {?PMC,?OMC,?PointFactory})
        flag;
        createTime;
    end
    
    methods
        function obj = OMC()
            obj.flag = 0;
        end
    end
    
end

