close all
clear
I = imread('snowflakes.png');
figure, imshow(I)

mask = adapthisteq(I);
figure, imshow(mask)

se = strel('disk',5);
marker = imerode(mask,se);
figure, imshow(marker)

obr = imreconstruct(marker,mask);
figure, imshow(obr,[])

img_open = imopen(mask, se);
figure, imshow(img_open)


