clear all
close all
clc

load('test_k20');

for i=1:25
    for j=1:25
     matconf(i,j) = length(find(clase(:,i)==j));
    end
end

matconf = (matconf/10)*100;

save('matconf_k20','matconf');