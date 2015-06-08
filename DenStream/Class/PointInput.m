classdef PointInput < handle
    %POINTINPUT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        DATA;
    end
    
    properties (Hidden = true,SetAccess = private)
        dimension;
    end
        
    methods
        function obj = PointInput(DATA,position)
            obj.DATA = DATA(position);
            s = size(obj.DATA.Coordinate);
            obj.dimension = s(2);
        end
        function Point = GetPoint(obj)
            Temp = obj.DATA;
            pointNumber = length(Temp.Time);
            Point(pointNumber,1).Time = 0;
            Point(pointNumber,1).Natural_Cluster_Name = 0;
            Point(pointNumber,1).Coordinate = zeros(1,obj.dimension);
            for i = 1:pointNumber
                Point(i).Time = Temp.Time(i);
                Point(i).Natural_Cluster_Name = Temp.Natural_Cluster_Name(i);
                Point(i).Coordinate = Temp.Coordinate(i,:);
            end
        end
        function DrawDot(obj)           %%%help
            obj.GetPoint;
            disp('»­Í¼');
        end
    end
    
end

