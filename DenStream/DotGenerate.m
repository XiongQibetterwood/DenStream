mu = zeros(3,2160);
for i = 1 : 180
    x = 20*sin(i*pi/90)+20;
    y = 20*cos(i*pi/90)+20;
    z = 20;
    mu(:,3*i-1) = [x y z];
end;
for j = 1 : 180
    x = j/2+10;
    y = j/3+10;
    z = j/4+10;
    mu(:,3*j-2) = [x y z];
end
for k = 1 : 180
    x = sin(k);
    y = k/2;
    z = 20;
    mu(:,3*k) = [x y z];
end
for i = 1 : 10
    for j = 540*i+1 : 540*i+540
    mu(:,i) = mu(:,j-540)/2+[i;i;i];
end


mu = mu';
plot3(mu(:,1),mu(:,2),mu(:,3),'r.','MarkerSize',0.5); 