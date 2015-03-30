addpath('lib')
clear all;
close all;
clc;

load('workspace2');

nTrees = 5;

features = promhist{1};
classLabels = [1];
for i=2:25
    features = [features promhist{i}];
    classLabels = [classLabels; i];
end
features = features';
B = TreeBagger(nTrees,features,classLabels, 'Method', 'classification');

for i=1:1
if i<10
    prefix = strcat('T0',int2str(i),'_');
else 
    prefix = strcat('T',int2str(i),'_');
end
command = strcat('find textures/test -name "',prefix,'*.jpg"');
[status, output]=system(command);
test_img(:,i) = strsplit(output);
end

im1=double((imread(char(test_img(1,1)))))/255;
tmap = assignTextons(fbRun(fb,im1),directoriotextones');
bcounter = histc(tmap(:),1:k)/numel(tmap);
bcounter = bcounter';
predChar1 = B.predict(bcounter);