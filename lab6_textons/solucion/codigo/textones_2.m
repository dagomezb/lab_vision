addpath('lib')
clear all;
close all;
clc;

load('traintextons_k10');

% histogramas de las imagenes
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




