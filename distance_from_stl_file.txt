%读取stl文件
TR_inner=stlread('your-file-name-inner.stl');
TR_outer=stlread('your-file-name-outer.stl');

%计算点与点之间的距离
D_initial=pdist2(TR_outer.Points, TR_inner.Points);

%最小距离（厚度）
[minDist,~]=min(D,[],2);

%可视化
c=minDist; %颜色根据间距值变化
s=20*minDist; %大小根据间距值变化，前面的常数可以改变

figure;
scatter3(TR_outer.Points(:,1), TR_outer.Points(:,2), TR_outer.Points(:,3), s, c, 'filled');
axis equal;
xlabel('X');
ylabel('Y');
zlabel('Z');
colorbar;