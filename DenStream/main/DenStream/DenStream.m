function[pointFactory] = DenStream(DATA,radiusEpsilon,weightMu,rateBeta,lambda)
PARA = Parameter(radiusEpsilon,weightMu,rateBeta,lambda);
pmcGroup = PMCGroup;
omcGroup = OMCGroup;
pointFactory = PointFactory(pmcGroup,omcGroup,PARA);
disp(PARA.T);
color = 'ymcrgbwk';
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
    pointFactory = pointFactory.DecayMC(PARA,time);
    
    [group_label,k] = DBSCAN_PMC( pmcGroup, 5, 3);
    temp = pmcGroup.groupMatrix;
    figure(i);
    hold on;
    color_index = 1;%ÑÕÉ«±êÇ©
    for index=1:k
        label = find(group_label == index);
        if length(label) > length(group_label)/20
            plot3(temp(label,1),temp(label,2),temp(label,3),'LineStyle','*','MarkerSize',5,'Color',color(color_index));
            color_index = color_index + 1;
        end
    end
    view(45,15)
    hold off;
end



