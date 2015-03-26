clear all;
close all;
clc;

%leer imagen
imgoriginal = imread('8068.jpg');
imshow(imgoriginal)
segmented = segment_by_clustering(imgoriginal,'rgb','watershed',3);
figure;
image(segmented);
colormap colorcube;


