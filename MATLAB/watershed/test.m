function test
close all
format compact

%%
% img = imread('cameraman.tif');
% img = imread('eight.tif');
% img = imread('tire.tif');
% img = imread('coins.png');
img = rgb2gray(imread('peppers.png'));

img2 = imguidedfilter(img);
% img2 = imfill(img2);
% [Gmag, ~] = imgradient(img2);
% Gmag2 = imguidedfilter(Gmag);
% Gmag2 = mat2gray(Gmag2);
% Gmag2(Gmag2 < 0.1) = 0;

% strelElement = fspecial('disk',10);
% img2 = imfilter(img2,strelElement,'replicate'); 

%%
waterImg = watershed(255-img2);
ridgeImg = waterImg == 0;
% catchmentImg = waterImg ~= 0;

demoImg = Utility.getHighLightImgTransparent(ridgeImg, img2, [80,-20,-20]);

%%


%%
figure, imshow(img)
figure, imshow(img2)
% figure, imshow(Gmag,[])
% figure, imshow(Gmag2,[])
Fig = figure;
Imshow = imshow(demoImg); hold on


set(Imshow,'ButtonDownFcn',{@clickcallback, Fig});
end

%%
function clickcallback(src, evt, Fig)
Fig.SelectionType
evt

end


