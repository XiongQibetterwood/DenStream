for i = 1 : 10;
    mu = [i i i];
    SIGMA = [0.5 0 0;0 0.5 0;0 0 0.5];
    r= mvnrnd(mu,SIGMA,250);
    DATA = r;
    plot3(DATA(:,1),DATA(:,2),DATA(:,3),'b.','MarkerSize',0.5); 
    hold on;
end
for i = 1:20;
    mu =  [10 10+i 10+i];
    SIGMA = [1 0 0;0 1 0;0 0 1];
    r = mvnrnd (mu,SIGMA,250);
    DATA = r;
    plot3(DATA(:,1),DATA(:,2),DATA(:,3),'b.','MarkerSize',0.5); 
    hold on;
end
for i = 1:10;
    k = round(sqrt(i));
    mu =  [40-k 40+k i];
    SIGMA = [3 0 0;0 3 0;0 0 3];
    r = mvnrnd (mu,SIGMA,250);
    DATA = r;
    plot3(DATA(:,1),DATA(:,2),DATA(:,3),'b.','MarkerSize',0.5); 
    hold on;
end
for i = 1:100;
    k = sin(i);
    mu =  [50 50+i 50+k];
    SIGMA = [0.1 0 0;0 0.1 0;0 0 0.1];
    r = mvnrnd (mu,SIGMA,50);
    DATA = r;
    plot3(DATA(:,1),DATA(:,2),DATA(:,3),'b.','MarkerSize',0.5); 
    hold on;
end
for angle = 1:100;
    i = 5*sin(angle);
    j = 10*cos(angle);
    mu =  [25 25+i 25+j];
    SIGMA = [1 0 0;0 1 0;0 0 1];
    r = mvnrnd (mu,SIGMA,50);
    DATA = r;
    plot3(DATA(:,1),DATA(:,2),DATA(:,3),'b.','MarkerSize',0.5); 
    hold on;
end


