function clase = clasificar(histograma, promhist)

nclases = size(promhist,1);

for i=1:nclases
    interseccion(i) = 0;
    for j=1:size(promhist{i},1)
        interseccion(i) = interseccion(i) + min(promhist{i}(j),histograma(j));
    end
end

[val,clase]=max(interseccion);
        

