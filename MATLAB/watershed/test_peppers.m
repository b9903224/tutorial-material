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
subplot(1, 2, 1); imshow(rgb); title('���');
subplot(1, 2, 2); imshow(I); title('�ǫ׹�');

%% step 2
hy = fspecial('sobel');
hx = hy';
Iy = imfilter(double(I), hy, 'replicate');
Ix = imfilter(double(I), hx, 'replicate');
gradmag = sqrt(Ix.^2 + Iy.^2);
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(1, 2, 1); imshow(I,[]), title('�ǫ׼v�H')
subplot(1, 2, 2); imshow(gradmag,[]), title('��״T�ȼv�H')

%% step 2.1
L = watershed(gradmag);
Lrgb = label2rgb(L);
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(1, 2, 1); imshow(gradmag,[]), title('��״T�ȼv�H')
subplot(1, 2, 2); imshow(Lrgb); title('��״T�Ȱ��������ܴ�')

%% step 3
se = strel('disk', 20);
Io = imopen(I, se);
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(1, 2, 1); imshow(I, []); title('�ǫ׼v�H');
subplot(1, 2, 2); imshow(Io), title('�v�H�}�ާ@')

%% step 3.1
Ie = imerode(I, se);
Iobr = imreconstruct(Ie, I);
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(1, 2, 1); imshow(I, []); title('�ǫ׼v�H');
subplot(1, 2, 2); imshow(Iobr, []), title('���}�����ؼv�H')

%% step 3.2
Ioc = imclose(Io, se);
Ic = imclose(I, se);
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(2, 2, 1); imshow(I, []); title('�ǫ׼v�H');
subplot(2, 2, 2); imshow(Io, []); title('�}�ާ@�v�H');
subplot(2, 2, 3); imshow(Ic, []); title('���ާ@�v�H');
subplot(2, 2, 4); imshow(Ioc, []), title('�}���ާ@');

%% step 3.3
Iobrd = imdilate(Iobr, se);
Iobrcbr = imreconstruct(imcomplement(Iobrd), imcomplement(Iobr));
Iobrcbr = imcomplement(Iobrcbr);
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(2, 2, 1); imshow(I, []); title('�ǫ׼v�H');
subplot(2, 2, 2); imshow(Ioc, []); title('�}���ާ@');
subplot(2, 2, 3); imshow(Iobr, []); title('���}�����ؼv�H');
subplot(2, 2, 4); imshow(Iobrcbr, []), title('��󳬪����ؼv�H');

%% step 3.4
fgm = imregionalmax(Iobrcbr);
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(1, 3, 1); imshow(I, []); title('�ǫ׼v�H');
subplot(1, 3, 2); imshow(Iobrcbr, []); title('��󭫫ت��}���ާ@');
subplot(1, 3, 3); imshow(fgm, []); title('�ϰ�ʷ��j�v�H');

%% step 3.5
It1 = rgb(:, :, 1);
It2 = rgb(:, :, 2);
It3 = rgb(:, :, 3);
It1(fgm) = 255; It2(fgm) = 0; It3(fgm) = 0;
I2 = cat(3, It1, It2, It3);
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(2, 2, 1); imshow(rgb, []); title('��v�H');
subplot(2, 2, 2); imshow(Iobrcbr, []); title('��󭫫ت��}���ާ@');
subplot(2, 2, 3); imshow(fgm, []); title('�ϰ�ʷ��j�v�H');
subplot(2, 2, 4); imshow(I2); title('�ϰ�ʷ��j�|�[���v�H');

%% step 3.6
se2 = strel(ones(5,5));
fgm2 = imclose(fgm, se2);
fgm3 = imerode(fgm2, se2);
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(2, 2, 1); imshow(Iobrcbr, []); title('��󭫫ت��}���ާ@');
subplot(2, 2, 2); imshow(fgm, []); title('�ϰ�ʷ��j�v�H');
subplot(2, 2, 3); imshow(fgm2, []); title('���ާ@');
subplot(2, 2, 4); imshow(fgm3, []); title('�G�k�ާ@');

%% step 3.7
fgm4 = bwareaopen(fgm3, 20);
It1 = rgb(:, :, 1);
It2 = rgb(:, :, 2);
It3 = rgb(:, :, 3);
It1(fgm4) = 255; It2(fgm4) = 0; It3(fgm4) = 0;
I3 = cat(3, It1, It2, It3);
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(2, 2, 1); imshow(I2, []); title('�ϰ�ʷ��j�|�[���v�H');
subplot(2, 2, 2); imshow(fgm3, []); title('���G�k�ާ@');
subplot(2, 2, 3); imshow(fgm4, []); title('�h���p���I�ާ@');
subplot(2, 2, 4); imshow(I3, []); title('�ק�ϰ�ʷ��j�|�[���v�H');

%% step 4
bw = im2bw(Iobrcbr, graythresh(Iobrcbr));
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(1, 2, 1); imshow(Iobrcbr, []); title('��󭫫ت��}���ާ@');
subplot(1, 2, 2); imshow(bw, []); title('�H�Ȥ���');

%% step 4.1
D = bwdist(bw);
DL = watershed(D);
bgm = DL == 0;
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(2, 2, 1); imshow(Iobrcbr, []); title('��󭫫ت��}���ާ@');
subplot(2, 2, 2); imshow(bw, []); title('�H�Ȥ���');
subplot(2, 2, 3); imshow(label2rgb(DL), []); title('�������ܴ��ܷN��');
subplot(2, 2, 4); imshow(bgm, []); title('�������ܴ���u��');

%% step 5
gradmag2 = imimposemin(gradmag, bgm | fgm4);
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(2, 2, 2); imshow(fgm4, []); title('�e���аO');
subplot(2, 2, 3); imshow(gradmag, []); title('��״T�ȼv�H');
subplot(2, 2, 4); imshow(gradmag2, []); title('�ק��״T�ȼv�H');

%% step 6
It1 = rgb(:, :, 1);
It2 = rgb(:, :, 2);
It3 = rgb(:, :, 3);
fgm5 = imdilate(L == 0, ones(3, 3)) | bgm | fgm4;
It1(fgm5) = 255; It2(fgm5) = 0; It3(fgm5) = 0;
I4 = cat(3, It1, It2, It3);
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(1, 2, 1); imshow(rgb, []); title('��v�H');
subplot(1, 2, 2); imshow(I4, []); title('�аO�M������t�|�[���v�H');

%% step 6.1
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(1, 2, 1); imshow(rgb, []); title('��v�H');
subplot(1, 2, 2); imshow(Lrgb); title('�m��������аO�x�}');

%% step 6.2
figure('units', 'normalized', 'position', [0 0 1 1]);
subplot(1, 2, 1); imshow(rgb, []); title('��v�H');
subplot(1, 2, 2); imshow(rgb, []); hold on;
himage = imshow(Lrgb);
set(himage, 'AlphaData', 0.3);
title('�аO�x�}�|�[���v�H');

