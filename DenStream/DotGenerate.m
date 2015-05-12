mu = zeros(3,1);
DATA.Coordinate = zeros(200000 , 3);
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
    SIGMA = [1 0 0 ; 0 1 0 ; 0 0 1] ;
    DATA.Coordinate( (i*50 - 49): (i*50), :) = mvnrnd(MU,SIGMA,50);
end
for i = 1:20
    index = (i-1)*10000 + randperm(10000);
    ind_old = ((i-1)*10000+1):(i*10000);
    DATA.Coordinate(ind_old , :) = DATA.Coordinate(index , :);
end
for i = 1 : 20
    plot3(DATA.Coordinate(10000*(i-1)+1:10000*i,1),DATA.Coordinate(10000*(i-1)+1:10000*i,2),DATA.Coordinate(10000*(i-1)+1:10000*i,3),'r.','MarkerSize',0.5);
    pause(1);
end

