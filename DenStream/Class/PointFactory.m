classdef PointFactory
    %POINTFACTORY Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        status = 0;
    end
    
    methods(Static)
        function obj = PointFactory()
        end
        function PMCGroup = MergePMC(point,PMCGroup)
            if PMCGroup.MCNumber == 0
                obj.status = 0;
            else if PMCGroup.MCNumber < 0
                    error('融入潜在核心微簇出错');
                else
                    tempMatrix = sum(bsxfun( '@minus',PMCGroup.groupMatrix, point.Coordinate).^2);
                    [rp_square,index] = min(tempMatrix);
                    pmc = PMCGroup.group(index);            %这个地方是否是指针？
                    temp = pmc.SaveDATA;
                    pmc = Renew(point);
                    if pmc.r < PARA.EPSILON
                        pmc = pmc.CalculateC_R;
                        obj.status = 1;
                    else
                        pmc = Recover(temp);
                    end
                end
            end
        end
        function OMCGroup = MergeOMC(point,OMCGroup)
            if OMCGroup.MCNumber == 0
                obj.status = 0;
            else if OMCGroup.MCNumber < 0
                    error('融入离群微簇出错');
                else
                    tempMatrix = sum(bsxfun( '@minus',OMCGroup.groupMatrix, point.Coordinate).^2);
                    [rp_square,index] = min(tempMatrix);
                    omc = OMCGroup.group(index);            %这个地方是否是指针？
                    temp = omc.SaveDATA;
                    omc = Renew(point);
                    if omc.r < PARA.EPSILON
                        omc = omc.CalculateC_R;
                    else
                        omc = Recover(temp);
                    end
                end
            end
        end
        function OMCGroup = CreateOMC(point,OMCGroup)
            mc = OMC;
            mc.weight = 1;
            mc.CF1 = point.Coordinate;
            mc.CF2 = (point.Coordinate*point.Coordinate');
            mc.r = 0;
            mc.c = point.Coordinate;
            mc.flag = 0;
            mc.createTime = point.Time;
            OMCGroup = OMCGroup.AddMC(mc);
        end
    end
    
end

