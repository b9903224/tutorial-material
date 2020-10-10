% https://www.itread01.com/content/1548046104.html
%% step 1
clc; clear all; close all;
rgb = imread('pears.png');
if ndims(rgb) == 3
    I = rgb2gray(rgb);
else
    I = rgb;
end
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(1, 2, 1); imshow(rgb); title('原圖');
subplot(1, 2, 2); imshow(I); title('灰度圖');

%% step 2
hy = fspecial('sobel');
hx = hy';
Iy = imfilter(double(I), hy, 'replicate');
Ix = imfilter(double(I), hx, 'replicate');
gradmag = sqrt(Ix.^2 + Iy.^2);
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(1, 2, 1); imshow(I,[]), title('灰度影象')
subplot(1, 2, 2); imshow(gradmag,[]), title('梯度幅值影象')

%% step 2.1
L = watershed(gradmag);
Lrgb = label2rgb(L);
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(1, 2, 1); imshow(gradmag,[]), title('梯度幅值影象')
subplot(1, 2, 2); imshow(Lrgb); title('梯度幅值做分水嶺變換')

%% step 3
se = strel('disk', 20);
Io = imopen(I, se);
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(1, 2, 1); imshow(I, []); title('灰度影象');
subplot(1, 2, 2); imshow(Io), title('影象開操作')

%% step 3.1
Ie = imerode(I, se);
Iobr = imreconstruct(Ie, I);
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(1, 2, 1); imshow(I, []); title('灰度影象');
subplot(1, 2, 2); imshow(Iobr, []), title('基於開的重建影象')

%% step 3.2
Ioc = imclose(Io, se);
Ic = imclose(I, se);
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(2, 2, 1); imshow(I, []); title('灰度影象');
subplot(2, 2, 2); imshow(Io, []); title('開操作影象');
subplot(2, 2, 3); imshow(Ic, []); title('閉操作影象');
subplot(2, 2, 4); imshow(Ioc, []), title('開閉操作');

%% step 3.3
Iobrd = imdilate(Iobr, se);
Iobrcbr = imreconstruct(imcomplement(Iobrd), imcomplement(Iobr));
Iobrcbr = imcomplement(Iobrcbr);
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(2, 2, 1); imshow(I, []); title('灰度影象');
subplot(2, 2, 2); imshow(Ioc, []); title('開閉操作');
subplot(2, 2, 3); imshow(Iobr, []); title('基於開的重建影象');
subplot(2, 2, 4); imshow(Iobrcbr, []), title('基於閉的重建影象');

%% step 3.4
fgm = imregionalmax(Iobrcbr);
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(1, 3, 1); imshow(I, []); title('灰度影象');
subplot(1, 3, 2); imshow(Iobrcbr, []); title('基於重建的開閉操作');
subplot(1, 3, 3); imshow(fgm, []); title('區域性極大影象');

%% step 3.5
It1 = rgb(:, :, 1);
It2 = rgb(:, :, 2);
It3 = rgb(:, :, 3);
It1(fgm) = 255; It2(fgm) = 0; It3(fgm) = 0;
I2 = cat(3, It1, It2, It3);
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(2, 2, 1); imshow(rgb, []); title('原影象');
subplot(2, 2, 2); imshow(Iobrcbr, []); title('基於重建的開閉操作');
subplot(2, 2, 3); imshow(fgm, []); title('區域性極大影象');
subplot(2, 2, 4); imshow(I2); title('區域性極大疊加到原影象');

%% step 3.6
se2 = strel(ones(5,5));
fgm2 = imclose(fgm, se2);
fgm3 = imerode(fgm2, se2);
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(2, 2, 1); imshow(Iobrcbr, []); title('基於重建的開閉操作');
subplot(2, 2, 2); imshow(fgm, []); title('區域性極大影象');
subplot(2, 2, 3); imshow(fgm2, []); title('閉操作');
subplot(2, 2, 4); imshow(fgm3, []); title('腐蝕操作');

%% step 3.7
fgm4 = bwareaopen(fgm3, 20);
It1 = rgb(:, :, 1);
It2 = rgb(:, :, 2);
It3 = rgb(:, :, 3);
It1(fgm4) = 255; It2(fgm4) = 0; It3(fgm4) = 0;
I3 = cat(3, It1, It2, It3);
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(2, 2, 1); imshow(I2, []); title('區域性極大疊加到原影象');
subplot(2, 2, 2); imshow(fgm3, []); title('閉腐蝕操作');
subplot(2, 2, 3); imshow(fgm4, []); title('去除小斑點操作');
subplot(2, 2, 4); imshow(I3, []); title('修改區域性極大疊加到原影象');

%% step 4
bw = im2bw(Iobrcbr, graythresh(Iobrcbr));
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(1, 2, 1); imshow(Iobrcbr, []); title('基於重建的開閉操作');
subplot(1, 2, 2); imshow(bw, []); title('閾值分割');

%% step 4.1
D = bwdist(bw);
DL = watershed(D);
bgm = DL == 0;
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(2, 2, 1); imshow(Iobrcbr, []); title('基於重建的開閉操作');
subplot(2, 2, 2); imshow(bw, []); title('閾值分割');
subplot(2, 2, 3); imshow(label2rgb(DL), []); title('分水嶺變換示意圖');
subplot(2, 2, 4); imshow(bgm, []); title('分水嶺變換脊線圖');

%% step 5
gradmag2 = imimposemin(gradmag, bgm | fgm4);
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(2, 2, 2); imshow(fgm4, []); title('前景標記');
subplot(2, 2, 3); imshow(gradmag, []); title('梯度幅值影象');
subplot(2, 2, 4); imshow(gradmag2, []); title('修改梯度幅值影象');

%% step 6
It1 = rgb(:, :, 1);
It2 = rgb(:, :, 2);
It3 = rgb(:, :, 3);
fgm5 = imdilate(L == 0, ones(3, 3)) | bgm | fgm4;
It1(fgm5) = 255; It2(fgm5) = 0; It3(fgm5) = 0;
I4 = cat(3, It1, It2, It3);
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(1, 2, 1); imshow(rgb, []); title('原影象');
subplot(1, 2, 2); imshow(I4, []); title('標記和物件邊緣疊加到原影象');

%% step 6.1
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(1, 2, 1); imshow(rgb, []); title('原影象');
subplot(1, 2, 2); imshow(Lrgb); title('彩色分水嶺標記矩陣');

%% step 6.2
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(1, 2, 1); imshow(rgb, []); title('原影象');
subplot(1, 2, 2); imshow(rgb, []); hold on;
himage = imshow(Lrgb);
set(himage, 'AlphaData', 0.3);
title('標記矩陣疊加到原影象');

