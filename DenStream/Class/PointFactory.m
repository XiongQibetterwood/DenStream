classdef PointFactory
    %POINTFACTORY Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        status = 0;
    end
    
    methods(Static)
        function obj = PointFactory()
        end
        function PMCGroup = MergePMC(point,PMCGroup)
        end
        function OMCGroup = MergeOMC(point,OMCGroup)
        end
        function OMCGroup = CreateOMC(point,OMCGroup)
        end
    end
    
end

