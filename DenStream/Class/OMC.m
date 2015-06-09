classdef OMC < MC
    %OMC Summary of this class goes here
    %   Detailed explanation goes here
    
    properties(GetAccess = public,SetAccess = private)
        flag;
        createTime;
    end
    properties(Access = private,Dependent = false)
        minWeight;
        currentTime;
    end
    
    methods
        function obj = OMC()
            obj.flag = 0;
        end

    end
    
end