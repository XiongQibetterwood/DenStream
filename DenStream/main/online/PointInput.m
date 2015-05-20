function Point = PointInput(DATA)
global dimension;

pointNumber = length(DATA.Time);
Point(pointNumber,1).Time = 0;
Point(pointNumber,1).Natural_Cluster_Name = 0;
Point(pointNumber,1).Coordinate = zeros(1,dimension);
for i = 1:pointNumber
    Point(i).Time = DATA.Time(i);
    Point(i).Natural_Cluster_Name = DATA.Natural_Cluster_Name(i);
    Point(i).Coordinate = DATA.Coordinate(i,:);
end
end