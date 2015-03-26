%Duvan Alberto Gomez Betancur
%Vision Artificial
%Lab_4 Segmentacion 

function my_segmentation = segment_by_clustering( rgb_image, feature_space, clustering_method, number_of_clusters)

if strcmp(clustering_method, 'hierarchical')
    rgb_image = imresize(rgb_image,0.5);
end

nrows = size(rgb_image,1);
ncols = size(rgb_image,2);


%manejo del color

%rgb
if strcmp(feature_space,'rgb')
    img = reshape(rgb_image,[],3);
    img = double(img);
%lab
elseif strcmp(feature_space,'lab')
    cform = makecform('srgb2lab');
    temporal = applycform(rgb_image,cform);
    temp = double(temporal(:,:,2:3));
    img = reshape(temp,nrows*ncols,2);
%hsv
elseif strcmp(feature_space,'hsv')
    img = reshape(rgb2hsv(rgb_image),[],3);
    img = double(img);
end

%rgb+xy
%elseif strcmp(feature_space,'rgb+xy')
%lab+xy
%elseif strcmp(feature_space,'lab+xy')
%hsv+xy
%elseif strcmp(feature_space,'hsv+xy')

%manejo del metodo de clustering


if strcmp(clustering_method, 'k-means')    
    [cluster_idx,C] = kmeans(img,number_of_clusters);
    pixel_labels = reshape(cluster_idx,nrows,ncols);
    my_segmentation = pixel_labels;
    
elseif strcmp(clustering_method, 'gmm')
    gmm = fitgmdist(img,number_of_clusters);
    gmmC = cluster(gmm, img);
    pixel_labels = reshape(gmmC,nrows,ncols);
    my_segmentation = pixel_labels;

elseif strcmp(clustering_method, 'hierarchical')
    hierarchical = linkage(img,'ward','euclidean');
    hierarchicalC = cluster(hierarchical,'maxclust',number_of_clusters);
    pixel_labels = reshape(hierarchicalC, nrows, ncols);
    my_segmentation = pixel_labels;
    
elseif strcmp(clustering_method, 'watershed')
    img = rgb2gray(rgb_image);
    I = img;
    hy = fspecial('sobel');
    hx = hy';
    Iy = imfilter(double(img), hy, 'replicate');
    Ix = imfilter(double(img), hx, 'replicate');
    gradmag = sqrt(Ix.^2 + Iy.^2);
    se = strel('disk', 20);
    Ie = imerode(I, se);
    Iobr = imreconstruct(Ie, I);
    Iobrd = imdilate(Iobr, se);
    Iobrcbr = imreconstruct(imcomplement(Iobrd), imcomplement(Iobr));
    Iobrcbr = imcomplement(Iobrcbr);
    fgm = imregionalmax(Iobrcbr);
    se2 = strel(ones(5,5));
    fgm2 = imclose(fgm, se2);
    fgm3 = imerode(fgm2, se2);
    fgm4 = bwareaopen(fgm3, 20);
    bw = im2bw(Iobrcbr, graythresh(Iobrcbr));
    D = bwdist(bw);
    DL = watershed(D);
    bgm = DL == 0;
    gradmag2 = imimposemin(gradmag, bgm | fgm4);
    L = watershed(gradmag2);
    Lrgb = label2rgb(L, 'jet', 'w', 'shuffle');
    my_segmentation = Lrgb;

end



    
