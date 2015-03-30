% Since TreeBagger uses randomness we will get different results each 
% time we run this.
% This makes sure we get the same results every time we run the code.
clear all;
close all;
clc;

rng default
 
% Here we create some training data.
% The rows&lt; represent the samples or individuals.
% The first two columns represent the individual's features.
% The last column represents the class label (what we want to predict)
trainData = [ ...
    [6,  300,  1];
    [3,  300,  0];
    [8,  300,  1];
    [11, 2000, 0];
    [3,  100,  0];
    [6,  1000, 0];
    ];
 
features = trainData(:,(1:2))
classLabels = trainData(:,3)
 
% How many trees do you want in the forest? 
nTrees = 20;
 
% Train the TreeBagger (Decision Forest).
B = TreeBagger(nTrees,features,classLabels, 'Method', 'classification');
 
% Given a new individual WITH the features and WITHOUT the class label,
% what should the class label be?
newData1 = [7, 300];
 
% Use the trained Decision Forest.
predChar1 = B.predict(newData1);
 
% Predictions is a char though. We want it to be a number.
predictedClass = str2double(predChar1)
% predictedClass =
%      1
 
% So we predict that for our new piece of data, we will have a class label of 1 
 
% Okay let's try another piece of data.
newData2 = [7, 1500];
 
predChar2 = B.predict(newData2);
predictedClass2 = str2double(predChar2)
% predictedClass2 =
%      0
 
% It predicts that the new class label is a 0.