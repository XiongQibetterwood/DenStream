classdef MC < handle
    %MC Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        weight;
        CF1;
        CF2;
        c;
        r;
    end
    
    methods
        function obj = MC()
        end
        function obj = Renew(obj,point)
            obj.weight = obj.weight + 1;
            obj.CF1 = obj.CF1 + point.Coorinate;
            obj.CF2 = obj.CF2 + (point.Coordinate*point.Coordinate');
        end
        function obj = Decay(obj,time)
            decayRate = 1/(2^(PARA.LAMBDA*time));
            obj.weight = obj.weight*decayRate;
            obj.CF1 = obj.CF1*decayRate;
            obj.CF2 = obj.CF2*decayRate;
        end
        function obj = CalculateC_R(obj)
            obj.c = obj.CF1/obj.weight;
            obj.r = sqrt(obj.CF2/obj.weight-(obj.CF1/obj.weight)^2);
        end
        function Temp = SaveDate(obj)
            Temp.weight = obj.weight;
            Temp.CF1 = obj.CF1;
            Temp.CF2 = obj.CF2;
        end
        function obj = Recover(obj)
            obj.weight = Time.weight;
            obj.CF1 = Time.CF1;
            obj.CF2 = Time.CF2;
            clear Temp;
        end
            
    end
    
end

