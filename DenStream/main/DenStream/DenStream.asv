function DenStream(DATA,radiusEpsilon,weightMu,rateBeta,lambda)
PARA = Parameter(radiusEpsilon,weightMu,rateBeta,lambda);
for i = 1:max(size(DATA))
    Point = PointInput(DATA,i).GetPoint;
    for j = 1 : max(size(Point))
        point = Point(j);
        PMCGroup = PointFactory(point,PMCGroup);
        if PointFactory.status == 0
            OMCGroup = PointFactory(point,OMCGroup);
            if PointFactory.status == 0
                OMCGroup = PointFactory(point,OMCGroup);
            end
        end
    end
end



