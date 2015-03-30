addpath('lib')
clear all;close all;clc;

load('workspace');

directoriotextones = [diccionario(1).textones];

for i=2:25
directoriotextones =[directoriotextones; diccionario(i).textones];
end

clear mapasclases;
clear tmap;
clear im2;

for j=1:25
for l=1:size(img,1)-1
im2 = double((imread(char(img(l,j)))))/255;
tmap = assignTextons(fbRun(fb,im2),directoriotextones');
mapasclases{j,l}=tmap;
clear tmap;
clear im2;
end
end