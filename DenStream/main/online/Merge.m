function[pClusterMicro,oClusterMicro] = Merge%(point);
global dimension;

%initialize a new p-cluster-micro;
pClusterMicro = struct;
pClusterMicro.radius = 0;
pClusterMicro.weight = 0;
pClusterMicro.squareWeight = 0;
pClusterMicro.pointNumber = 0;
pClusterMicro.coordinate = zeros(1,dimension);
pClusterMicro(1) = [];

%initialize a new o-cluster-micro;
oClusterMicro = struct;
oClusterMicro.radius = 0;
oClusterMicro.weight = 0;
oClusterMicro.squareWeight = 0;
oClusterMicro.pointNumber = 0;
oClusterMicro.creationTime = 0;
oClusterMicro.coordinate = zeros(1,dimension);
