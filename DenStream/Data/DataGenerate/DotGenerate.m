function[DATA] = DotGenerate(sigma)
mu = zeros(3,1);
DATA.Coordinate = zeros(200000 , 3);
DATA.Time = reshape(ones(1000,1)*(1:200),200000,1);
DATA.Natural_Cluster_Name = repmat([ones(1,3000),2*ones(1,3000),3*ones(1,3000),4*ones(1,1000)],1,20);
for time = 1 : 20
    for i = 1 : 60
        x = (21-time)*sin(i*pi/30)+21-time;
        y = (21-time)*cos(i*pi/30)+21-time;
        z = 21-time;
        mu(:,i+(time-1)*200) = [x y z];
    end;
    for j = 1 : 60
        x = j/2+15;
        y = j/3+15;
        z = j/4+15;
    mu(:,60+j+(time-1)*200) = [x y z];
    end
    for k = 1 : 60
        x = sin(k);
        y = k/2;
        z = 30;
        mu(:,120+k+(time-1)*200) = [x y z];
    end
    for i = 1 : 20
        x = i+time;
        y = sqrt(i);
        z = 0;
        mu(:,180+i+(time-1)*200) = [x y z];
    end
end
mu = mu';

for i = 1 : 4000
    MU = mu(i,:) ;
    SIGMA = [sigma 0 0 ; 0 sigma 0 ; 0 0 sigma] ;
    DATA.Coordinate( (i*50 - 49): (i*50), :) = mvnrnd(MU,SIGMA,50);
end
for i = 1:20
    index = (i-1)*10000 + randperm(10000);
    ind_old = ((i-1)*10000+1):(i*10000);
    DATA.Coordinate(ind_old , :) = DATA.Coordinate(index , :);
    DATA.Natural_Cluster_Name(ind_old) = DATA.Natural_Cluster_Name(index);
end
DATA.Natural_Cluster_Name = DATA.Natural_Cluster_Name';
%figure(1);
%ind1 = find(DATA.Natural_Cluster_Name == 1);
%ind2 = find(DATA.Natural_Cluster_Name == 2);
%ind3 = find(DATA.Natural_Cluster_Name == 3);
%ind4 = find(DATA.Natural_Cluster_Name == 4);
%plot3(DATA.Coordinate(ind1,1),DATA.Coordinate(ind1,2),DATA.Coordinate(ind1,3),'r.',DATA.Coordinate(ind2,1),DATA.Coordinate(ind2,2),DATA.Coordinate(ind2,3),'g.',DATA.Coordinate(ind3,1),DATA.Coordinate(ind3,2),DATA.Coordinate(ind3,3),'b.',DATA.Coordinate(ind4,1),DATA.Coordinate(ind4,2),DATA.Coordinate(ind4,3),'y.'); 

