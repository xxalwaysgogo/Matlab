TR=trisurf('your_stl_file_name.stl')

% 创建ABAQUS输入文件
fid = fopen('surfdata.inp', 'w');

% 写入节点信息
fprintf(fid, '*NODE\n');
for i = 1:size(TR.Points, 1)
    fprintf(fid, '%d,%f,%f,%f\n', i, TR.Points(i, 1), TR.Points(i, 2), TR.Points(i, 3));
end


% 写入单元信息
fprintf(fid, '*ELEMENT,TYPE=S3R\n');
for i = 1:size(TR.ConnectivityList, 1)
    fprintf(fid, '%d,%d,%d,%d\n', i, TR.ConnectivityList(i, 1), TR.ConnectivityList(i, 2), TR.ConnectivityList(i, 3));
end

% 关闭文件句柄
fclose(fid);