function DenStream(DATA,radiusEpsilon,weightMu,rateBeta,lambda)
PARA = Parameter(radiusEpsilon,weightMu,rateBeta,lambda);
pmcGroup = PMCGroup;
omcGroup = OMCGroup;
for i = 1:max(size(DATA))
    Point = PointInput(DATA,i).GetPoint;
    time = Point(1).Time;
    for j = 1 : max(size(Point))
        point = Point(j);
        PointFactory(point,pmcGroup);
        if PointFactory.status == 0
            PointFactory(point,omcGroup);
            if PointFactory.status == 0
                PointFactory(point,omcGroup);
            end
        end
    end
end



