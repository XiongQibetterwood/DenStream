classdef Group < handle
    %GROUP Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        group = struct;
        groupMatrix;
        MCNumber;
    end
    
    methods
        function obj = Group()
            obj.group(1,:) = [];
            obj.MCNumber = 0;
        end
        function obj = AddMC(obj,MC)
            obj.MCNumber = obj.MCNumber + 1;
            obj.group(obj.MCNumber,:).microCluster = MC;
            obj.groupMatrix = [obj.groupMatrix;MC.c];
        end
        function obj = DeleteMC(obj,index)
            obj.MCNumber = obj.MCNumber - 1;
            obj.group(index,:) = [];
            obj.groupMatrix(index,:) = [];
        end
        function obj = RenewMC(obj,index)
            MC = obj.group(index,:).microCluster;
            obj.groupMatrix(index,:) = MC.c;
        end
            
    end
    
end