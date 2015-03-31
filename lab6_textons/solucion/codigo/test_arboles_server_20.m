addpath('lib')
clear all;
close all;
clc;

tic

%load('trainfull_arboles_20')
load('histarboles20full')
% for i=1:25
% if i<10
%     prefix = strcat('T0',int2str(i),'_');
% else 
%     prefix = strcat('T',int2str(i),'_');
% end
% command = strcat('find textures/test -name "',prefix,'*.jpg"');
% [status, output]=system(command);
% atest_img(:,i) = strsplit(output);
% end
% 
% atest_img
% 
% for j=1:i
% for l=1:size(atest_img,1)
% taimg=double((imread(char(atest_img(l,j)))))/255;
% tamap = assignTextons(fbRun(fb,taimg),diccionariotextones');
% tahistogramas{l,j} = histc(tamap(:),1:k)/numel(tamap);
% end
% clear tamap;
% clear taimag
% avance1 = j/i
% end
i=25;
for j=1:i
 for l=1:size(atest_img,1)
    toclasify = tahistogramas{l,j}';
    claseB5(l,j) = B5.predict(toclasify);
    claseB15(l,j) = B15.predict(toclasify);
    claseB25(l,j) = B25.predict(toclasify);
 end
 clear toclasify;
 avance = j/i
end

save('resultfull_arboles_20','claseB5','claseB15','claseB25')

toc
