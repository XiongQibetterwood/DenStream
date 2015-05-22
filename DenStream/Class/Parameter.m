classdef Parameter
    %PARAMETER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (SetAccess = private)
        RADIUS_EPSILON;
        WEIGHT_MU;
        RATE_BETA;
        LAMBDA;
    end
    properties
        T;
    end
    
    methods
        function obj = Parameter(radiusEpsilon,weightMu,rateBeta,lambda)
            obj.RADIUS_EPSILON = radiusEpsilon;
            obj.WEIGHT_MU = weightMu;
            obj.RATE_BETA = rateBeta;
            obj.LAMBDA = lambda;
            obj.T = ceil((1/lambda)*log2((rateBeta*weightMu)/(rateBeta*weightMu-1)));
        end
    end
    
end

