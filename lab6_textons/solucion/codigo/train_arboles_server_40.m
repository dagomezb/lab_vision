addpath('lib')
clear all;
close all;
clc;

tic

load('test_k40.mat');

features = promhist{1};
classLabels = [1];
for i=2:25
    features = [features promhist{i}];
    classLabels = [classLabels; i];
end
features = features';
B5 = TreeBagger(5,features,classLabels, 'Method', 'classification');
B15 = TreeBagger(15,features,classLabels, 'Method', 'classification');
B25 = TreeBagger(25,features,classLabels, 'Method', 'classification');

save('train_arboles_40')

toc