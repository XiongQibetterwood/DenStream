function[pClusterMicro,oClusterMicro] = Online(DATA,radiusEpsilon,weightMu,rateBeta,lambda)

global Time;
global RADIUS_EPSILON;
global WEIGHT_MU;
global RATE_BETA;
global LAMBDA;
global dimension;

Time = 1;
RADIUS_EPSILON = radiusEpsilon;
WEIGHT_MU = weightMu;
RATE_BETA = rateBeta;
LAMBDA = lambda;
dimension = min(size(DATA(1).Coordinate));

point = InputPoint(DATA,haveDoneFlag);
[pClusterMicro,oClusterMicro] = Merge(point);
[pClusterMicro,oClusterMicro] = Update(pClusterMicro,oClusterMicro);

