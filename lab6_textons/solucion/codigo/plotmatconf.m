close all;
clear all;
clc;

load('resultfull_arboles_20')

%toplot = (matconfB5/(max(max(matconfB5))))*255;

colormap('gray')
%image(toplot)

