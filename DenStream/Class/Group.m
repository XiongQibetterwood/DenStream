classdef Group
    %GROUP Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        group = struct;
        groupMatrix;
        MCNumber;
    end
    
    methods
        function obj = Group()
            obj.group(1) = [];
            obj.MCNumber = 0;
        end
        function obj = AddMC(obj,MC)
            obj.MCNumber = obj.MCNumber + 1;
            obj.group(obj.MCNumber).microCluster = MC;
        end
            
    end
    
end

