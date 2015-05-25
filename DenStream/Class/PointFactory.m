classdef PointFactory < handle
    %POINTFACTORY Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        status;
        pmcGroup;
        omcGroup;
        PARA;
    end
    
    methods 
        function obj = PointFactory(PMCGroup,OMCGroup,PARA)
            obj.status = 0;
            obj.pmcGroup = PMCGroup;
            obj.omcGroup = OMCGroup;
            obj.PARA = PARA;
        end
        function obj = PMerge(obj,point)
            if obj.pmcGroup.MCNumber == 0
                obj.status = 0;
            else
                [rp,index] = min(sqrt(sum((bsxfun( @minus,obj.pmcGroup.groupMatrix,point.Coordinate).^2),2)));
                cluster = obj.pmcGroup.group(index).microCluster;
                temp = cluster.SaveData;
                cluster = cluster.Renew(point);
                cluster = cluster.CalculateC_R;
                if cluster.r <= obj.PARA.RADIUS_EPSILON
                    obj.pmcGroup.groupMatrix(index,:) = cluster.c;
                    obj.status = 1;
                else
                    cluster = cluster.Recover(temp);
                    cluster = cluster.CalulateC_R;
                    if obj.pmcGroup.group(index).microCluster ~= cluster
                        error('Potentiel micro cluster:wrong');
                    end
                    obj.status = 0;
                end
            end
        end
        function obj = OMerge(obj,point)
            if obj.omcGroup.MCNumber == 0
                obj.status = 0;
            else 
                [rp,index] = min(sqrt(sum((bsxfun(@minus,obj.omcGroup.groupMatrix,point.Coordinate).^2),2)));
                cluster = obj.omcGroup.group(index).microCluster;
                temp = cluster.SaveData;
                cluster = cluster.Renew(point);
                cluster = cluster.CalculateC_R;
                if cluster.r <= obj.PARA.RADIUS_EPSILON
                    obj.omcGroup.groupMatrix(index,:) = cluster.c;
                    obj.status = 1;
                else
                    cluster = cluster.Recover(temp);
                    cluster = cluster.CalculateC_R;
                    if obj.omcGroup.group(index).microCluster ~=cluster
                        error('Outlier micro cluster:wrong');
                    end
                    obj.status = 0;
                end
            end
        end
        function obj = CreateOMC(obj,point)
            obj.status = 1;
            omc = OMC;
            omc.weight = 1;
            omc.createTime = point.Time;
            omc.CF1 = point.Coordinate;
            omc.CF2 =  0;
            omc = omc.CalculateC_R;
            obj.omcGroup = obj.omcGroup.AddMC(omc);
        end
    end
        
end

