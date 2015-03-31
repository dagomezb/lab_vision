clear all
close all
clc

load('resultfull_arboles_40');

for i=1:25
    for j=1:10
        B5 = cell2mat(claseB5(j,i));
        B15 = cell2mat(claseB15(j,i));
        B25 = cell2mat(claseB25(j,i));
        B52 = str2double(B5);
        B152 = str2double(B15);
        B252 = str2double(B25);
        clasesB5(j,i) = B52;
        clasesB15(j,i) = B152;
        clasesB25(j,i) = B252;
    end
end



for i=1:25 
    for j=1:25      
    matconfB5(i,j) = length(find(clasesB5(:,i)==j));
    matconfB15(i,j) = length(find(clasesB15(:,i)==j));
    matconfB25(i,j) = length(find(clasesB25(:,i)==j));
    end
end

matconfB5 = (matconfB5/10)*100;
matconfB15 = (matconfB15/10)*100;
matconfB25 = (matconfB25/10)*100;

% precB5 = sum(diag(matconfB5))/25
% precB15 = sum(diag(matconfB15))/25
% precB25 = sum(diag(matconfB25))/25

% toplot = (matconfB25/(max(max(matconfB25))))*255;
% colormap('gray')
% image(toplot)

resta = diag(matconfB25);
resta2=diag(resta');
matriz = matconfB25 - resta2;
