function scriptojpg

 !find *.tiff > archivos.txt
 
 fid = fopen('archivos.txt','r');
 
 A1=textscan(fid,'%s');
 
 fclose(fid);
 
 for i=1:size(A1{1})
 A = char(A1{1}(i));
 tojpg(A);
 clear A;
 end
 
 
end


function tojpg (A)

temp = imread(A);
long = length(A);
imwrite(temp,strcat('jpg/',A(1:long-5),'.jpg'),'jpg');

end

