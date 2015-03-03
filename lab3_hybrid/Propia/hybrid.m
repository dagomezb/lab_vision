clear all;
close all;
clc;

A = imread('Marrano.png');
B = imread('JuanD.png');

filter1 = fspecial('gaussian',70,6);
filter2 = fspecial('gaussian',40,7);

Img1 = A - imfilter (A,filter1);
Img2 = imfilter(B,filter2);

Hybrid = Img1 + Img2;

I1 = impyramid(Hybrid, 'reduce');
I2 = impyramid(I1, 'reduce');
I3 = impyramid(I2, 'reduce');
  
vis = vis_hybrid_image(Hybrid);

imshow(vis)