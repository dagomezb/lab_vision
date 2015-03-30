tic

addpath('lib')
clear all;
close all;
clc;

load('train_k10');

%lista de imagenes de prueba
for i=1:25
if i<10
    prefix = strcat('T0',int2str(i),'_');
else 
    prefix = strcat('T',int2str(i),'_');
end
command = strcat('find textures/test -name "',prefix,'*.jpg"');
[status, output]=system(command);
test_img(:,i) = strsplit(output);
end

for j=1:i
for l=1:size(test_img,1)-1
timg=double((imread(char(test_img(l,j)))))/255;
tmap = assignTextons(fbRun(fb,timg),diccionariotextones');
thistogramas{l,j} = histc(tmap(:),1:k)/numel(tmap);
end
clear tmap;
clear timag
end


for j=1:i
 for l=1:size(test_img,1)-1
    clase(l,j) = clasificar(thistogramas{l,j},promhist);
 end
end


toc
    

