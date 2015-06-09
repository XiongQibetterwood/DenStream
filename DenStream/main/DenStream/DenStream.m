function[pointFactory] = DenStream(DATA,radiusEpsilon,weightMu,rateBeta,lambda)
PARA = Parameter(radiusEpsilon,weightMu,rateBeta,lambda);
pmcGroup = PMCGroup;
omcGroup = OMCGroup;
pointFactory = PointFactory(pmcGroup,omcGroup,PARA);
disp(PARA.T);
for i = 1:max(size(DATA))
    
    Point = PointInput(DATA,i).GetPoint;
    time = Point(1).Time;
    for j = 1 : max(size(Point))
        pointFactory.status = 0;
        point = Point(j);
        pointFactory = pointFactory.PMerge(point);
        if pointFactory.status == 0
            pointFactory = pointFactory.OMerge(point,time);
        end
        if pointFactory.status == 0
            pointFactory = pointFactory.CreateOMC(point,time);
        end
    end
    %The part "Merge" have done.
    pointFactory = pointFactory.DecayMC(PARA);
end



