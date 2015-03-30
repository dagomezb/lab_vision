clear all;
close all;
clc;

load('test_k10')

for i=1:25
if i<10
    prefix = strcat('T0',int2str(i),'_');
else 
    prefix = strcat('T',int2str(i),'_');
end
command = strcat('find textures/train -name "',prefix,'*.jpg"');
[status, output]=system(command);
img(:,i) = strsplit(output);
end