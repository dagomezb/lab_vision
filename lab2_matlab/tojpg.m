function tojpg (A)

temp = imread(A);
imwrite(temp,'nuevaimagen.jpg','jpg');
