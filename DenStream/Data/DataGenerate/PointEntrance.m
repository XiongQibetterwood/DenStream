function[point] = PointEntrance(sigma)
DATA = DotGenerate(sigma);
point.Coordinate = zeros(1000 , 3);
point.Time = zeros(1000 , 1);
point.Natural_Cluster_Name = zeros(1000 , 1);
point = repmat(point, 200, 1);
for i = 1 : 200
    index = ((i-1)*1000+1):(i*1000);
    point(i).Time = DATA.Time(index);
    point(i).Coordinate = DATA.Coordinate(index,:);
    point(i).Natural_Cluster_Name = DATA.Natural_Cluster_Name(index);
end

