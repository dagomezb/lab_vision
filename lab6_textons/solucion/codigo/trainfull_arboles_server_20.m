addpath('lib')
clear all;
close all;
clc;

tic

load('train_k20.mat');
idx = 1;
for i=1:25
    for j=1:30
    histograma = histogramas{i,j}';
    features (idx,:) = histograma;
    classLabels (idx,:) = i;
    idx = idx+1;
    end
end

% for i=2:25
%     features = [features promhist{i}];
%     classLabels = [classLabels; i];
% end
% features = features';

% features = promhist{1};
% classLabels = [1];
% for i=2:25
%     features = [features promhist{i}];
%     classLabels = [classLabels; i];
% end
% features = features';
 B5 = TreeBagger(5,features,classLabels, 'Method', 'classification');
 B15 = TreeBagger(15,features,classLabels, 'Method', 'classification');
 B25 = TreeBagger(25,features,classLabels, 'Method', 'classification');

save('trainfull_arboles_20')

toc