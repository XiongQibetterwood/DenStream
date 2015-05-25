function DenStream(DATA,radiusEpsilon,weightMu,rateBeta,lambda)
PARA = Parameter(radiusEpsilon,weightMu,rateBeta,lambda);
pmcGroup = PMCGroup;
omcGroup = OMCGroup;
for i = 1:max(size(DATA))
    Point = PointInput(DATA,i).GetPoint;
    time = Point(1).Time;
    for j = 1 : max(size(Point))
        point = Point(j);
        pointFactory = PointFactory(pmcGroup,omcGroup,PARA);
        pointFactory.PMerge(point);
        if pointFactory.status == 0
            pointFactory.OMerge(point);
            if pointFactory.status == 0
                pointFactory.CreateOMC(point)
            end
        end
    end
end



