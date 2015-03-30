addpath('lib')
clear all;
close all;
clc;

tic

% numero de textones en diccionario
k = 10;
%numero de clases
nclases = 25;
%clases
clases={'bark1' 'bark2' 'bark3' 'wood1' 'wood2' 'wood3' 'water' 'granite' 'marble' 'floor1' 'floor2' 'pebbles' 'wall' 'brick1' 'brick2' 'glass1' 'glass2' 'carpet1' 'carpet2' 'upholstery' 'wallpaper' 'fur' 'knit' 'corduroy' 'plaid'};
% create filter bank
[fb] = fbCreate;

%lista de imagenes'
for i=1:nclases
if i<10
    prefix = strcat('T0',int2str(i),'_');
else 
    prefix = strcat('T',int2str(i),'_');
end
command = strcat('find textures/train -name "',prefix,'*.jpg"');
[status, output]=system(command);
img(:,i) = strsplit(output);
end

% para diccionario de textones
for j=1:i
% imagen referencia
im1=double((imread(char(img(j,1)))))/255;
% diccionario
[map,textons] = computeTextons(fbRun(fb,im1),k);
directorio(j).clase=char(clases(j));
directorio(j).mapa=map;
directorio(j).textones=textons;
end


diccionariotextones = [directorio(1).textones];

for i=2:25
diccionariotextones =[diccionariotextones; directorio(i).textones];
end

%textones otras imagenes de la clase
for j=1:25
for l=1:size(img,1)-1
im2 = double((imread(char(img(l,j)))))/255;
tmap = assignTextons(fbRun(fb,im2),diccionariotextones');
mapasclases{j,l}=tmap;
clear tmap;
clear im2;
end
end

for j=1:25
for l=1:size(img,1)-1
histemp = histc(mapasclases{j,l}(:),1:k)/numel(mapasclases{j,l});
histogramas{j,l}=histemp;
clear histemp;
end
end

for j=1:25
sumhist = zeros(size(histogramas{j,1}));
for l=1:size(img,1)-1
sumhist = sumhist + histogramas{j,l};
end
%histograma promedio
promhist{j,1} = sumhist/(size(img,1)-1);
end

save('train_k10')

toc









