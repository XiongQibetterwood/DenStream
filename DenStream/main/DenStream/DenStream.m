function[pClusterMicro,oClusterMicro] = DenStream(DATA,radiusEpsilon,weightMu,rateBeta,lambda)
PARA = Parameter(radiusEpsilon,weightMu,rateBeta,lambda);
for i = 1:max(size(DATA))
    Point = PointInput(DATA,i).GetPoint;
    
end



