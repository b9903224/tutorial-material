function test2
close all
format compact
set(0,'DefaultFigureWindowStyle','docked')

%%
[img, map] = imread('steel_grains.gif');
img = ind2gray(img, map);
img2 = imcomplement(img);
img3 = imhmin(img2, 20);
% img3 = imhmin(img2, 50);

% figure, imshow(img)
% figure, imshow(imerode(img, strel('disk', 1)))
% figure, imshow(imopen(img, strel('disk', 1)))

%%
waterImg = watershed(img3);
ridgeImg = waterImg == 0;
% catchmentImg = waterImg ~= 0;
labelRgb = label2rgb(waterImg, 'parula', 'w', 'shuffle');
demoImg = Utility.getHighLightImgTransparent(ridgeImg, img, [80,0,0]);


%%
% branchPointImg = getBranchPointImg(ridgeImg);

%%
figure, imshow(img)
figure, imshow(img2)
figure, imshow(img3)
figure, imshow(imcomplement(img3))
figure, imshow(ridgeImg)
figure, imshow(demoImg)
figure, imshow(labelRgb)


% set(Imshow,'ButtonDownFcn',{@clickcallback, Fig});
end

%%
function clickcallback(src, evt, Fig)
Fig.SelectionType
evt

end


