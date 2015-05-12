mu = zeros(3,1);
DATA = zeros(200000, 3);
DATA2 = DATA;
lable = repmat([ones(1,3000),2*ones(1,3000),3*ones(1,3000),4*ones(1,1000)],1,20);
lable2 = zeros(1, 200000);
for time = 1 : 20
    for i = 1 : 60
        x = (21-time)*sin(i*pi/30)+21-time;
        y = (21-time)*cos(i*pi/30)+21-time;
        z = 21-time;
        mu(:,i+(time-1)*200) = [x y z];
    end;
    for j = 1 : 60
        x = j/2+10;
        y = j/3+10;
        z = j/4+10;
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
    DATA( (i*50 - 49): (i*50), :) = mvnrnd(MU,SIGMA,50);
    %plot3(DATA(:,1),DATA(:,2),DATA(:,3),'r.','MarkerSize',0.5); 
end

for i = 1:20
    index = (i-1)*10000 + randperm(10000);
    ind_old = ((i-1)*10000+1):(i*10000);
    DATA2(ind_old , :) = DATA(index , :);
    lable2(ind_old) = lable(index);
end

figure(1);
ind1 = find(lable == 1);ind2 = find(lable == 2);ind3 = find(lable == 3);ind4 = find(lable == 4);
plot3(DATA(ind1,1),DATA(ind1,2),DATA(ind1,3),'r.',DATA(ind2,1),DATA(ind2,2),DATA(ind2,3),'g.',DATA(ind3,1),DATA(ind3,2),DATA(ind3,3),'b.',DATA(ind4,1),DATA(ind4,2),DATA(ind4,3),'y.'); 

figure(2);
ind1 = find(lable2 == 1);ind2 = find(lable2 == 2);ind3 = find(lable2 == 3);ind4 = find(lable2 == 4);
plot3(DATA2(ind1,1),DATA2(ind1,2),DATA2(ind1,3),'r.',DATA2(ind2,1),DATA2(ind2,2),DATA2(ind2,3),'g.',DATA2(ind3,1),DATA2(ind3,2),DATA2(ind3,3),'b.',DATA2(ind4,1),DATA2(ind4,2),DATA2(ind4,3),'y.'); 


