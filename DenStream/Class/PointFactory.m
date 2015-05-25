classdef PointFactory < handle
    %POINTFACTORY Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        status;
        pmcGroup;
        omcGroup;
    end
    
    methods (Static)
        function obj = PointFactory(PMCGroup,OMCGroup)
            obj.status = 0;
            obj.pmcGroup = PMCGroup;
            obj.omcGroup = OMCGroup;
        end
        function 
    end
        
end

