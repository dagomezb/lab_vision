clear all;
close all;
clc;

%leer imagen
imgoriginal = imread('8068.jpg');
imshow(imgoriginal)
tic
segmented = segment_by_clustering(imgoriginal,'rgb','watershed',3);
toc
figure;
image(segmented);
colormap colorcube;


