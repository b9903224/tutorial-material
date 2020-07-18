% position: [x, y]
% lattice by 2 vector: https://www.mathworks.com/matlabcentral/answers/479349-plotting-a-2d-crystal-lattice-from-two-primitive-lattice-vectors
% Convert xy Coordinates to Matrix: https://www.mathworks.com/matlabcentral/answers/76990-convert-xy-coordinates-to-matrix
%%
function insertCircleAry_demo

warning('off', 'all');
close all
format compact
rng('shuffle');

%%
resizeRatio = 4;
img = imread('cameraman.tif');
img = imresize(img, resizeRatio, 'nearest');
[imgH, imgW] = size(img);

point_center = [128,133] * resizeRatio;
point_1 = [146,120] * resizeRatio;
point_2 = [118,110] * resizeRatio;
points = [point_center; point_1; point_2];
radius = 5 * resizeRatio;
XY_lattice = get_XY_lattice(imgH, imgW, point_center, point_1, point_2, radius);

%%
% img_dot = get_img_dot(img, XY_lattice, points);
% figure, imshow(img_dot)

%%
circleAryImg = getCircleAryImg(img, XY_lattice, radius, radius-2, [0,200,200], 5, 3, [0,200,200]);
figure, imshow(circleAryImg)

%%
figure, imshow(img), hold on
scatter(XY_lattice(:, 1), XY_lattice(:, 2))
scatter(points(:, 1), points(:, 2), '+')

end

%%
function circleAryImg = getCircleAryImg(img, XY_lattice,...
    r_outter, r_inner, rgb, crossLef_half, crossWidth, rgb_cross)

circleAryImg = img;
[imgH, imgW, imgZ] = size(img);
if imgZ == 1
    cat(3, circleAryImg, circleAryImg ,circleAryImg);
end

%% check value can plot on image
XY_lattice = round(XY_lattice);
checkValueFunc = @(x,minValue,maxValue) min(max(x,minValue),maxValue);
XY_lattice(:, 1) = arrayfun(@(x) checkValueFunc(x, 1, imgW), XY_lattice(:, 1));
XY_lattice(:, 2) = arrayfun(@(y) checkValueFunc(y, 1, imgH), XY_lattice(:, 2));

%%
[X, Y] = meshgrid(1 : imgW, 1 : imgH);
circleAryTemplate = false(imgH, imgW);
r_outter_square = r_outter^2;
r_inner_square = r_inner^2;

%%
len = size(XY_lattice, 1);
for index = 1 : len
    xy_lattice = XY_lattice(index, :);
    x = xy_lattice(1);
    y = xy_lattice(2);
    Z = ((X-x).^2+(Y-y).^2);
    tempImg = Z < r_outter_square & Z >= r_inner_square;
    circleAryTemplate = circleAryTemplate | tempImg;
end
% figure, imshow(circleAryTemplate)

%%
strelElent = zeros(crossLef_half*2+1);
strelElent(crossLef_half+1, :) = 1;
strelElent(:, crossLef_half+1) = 1;
strelElent = imdilate(strelElent, strel('square', crossWidth));
crossTemplate = false(imgH, imgW);
crossTemplate(sub2ind(size(crossTemplate),XY_lattice(:,2),XY_lattice(:,1))) = true;
crossTemplate = imdilate(crossTemplate, strelElent);

%%
circleAryImg = Utility.getHighLightImgTransparent(circleAryTemplate, circleAryImg, rgb);
circleAryImg = Utility.getHighLightImgTransparent(crossTemplate, circleAryImg, rgb_cross);
% figure, imshow(circleAryImg)

end

%%
function img_dot = get_img_dot(img, XY_lattice, points)

[imgH, imgW] = size(img);

destImg = false(imgH, imgW);
destImg(sub2ind(size(destImg),XY_lattice(:,2),XY_lattice(:,1))) = true;
img_dot = Utility.getHighLightImg(destImg, img, [0, 0, 255]);

destImg = false(imgH, imgW);
destImg(sub2ind(size(destImg),points(:,2),points(:,1))) = true;
img_dot = Utility.getHighLightImg(destImg, img_dot, [255, 0, 0]);

end

%%
function XY_lattice = get_XY_lattice(imgH, imgW,...
    point_center, point_1, point_2, radius)

% XY_lattice = [[x1,x2,...]', [y1,y2,...]'];

%%
% tempImg = false(imgH, imgW);
% tempImg = replaceEdgeValue(tempImg, radius*2, true);

% [lower bound, upper bound]
x_bound = [1 + radius*2, imgW - radius*2];
y_bound = [1 + radius*2, imgH - radius*2];

v1 = point_1 - point_center;
v2 = point_2 - point_center;

imgH_half = round(imgH/2);
imgW_half = round(imgW/2);

%%
[x, y] = meshgrid(-imgW_half:imgW_half, -imgH_half:imgH_half);
xy = [x(:), y(:)];
T = [v1;v2];

xyt = xy*T;
xyt = [xyt(:, 1) + point_center(1), xyt(:, 2) + point_center(2)];

xt = xyt(:, 1);
yt = xyt(:, 2);
XY_lattice = xyt(xt > x_bound(1) & xt < x_bound(2) & yt > y_bound(1) & yt < y_bound(2), :);

%%
% xt = reshape(xyt(:,1),size(x));
% yt = reshape(xyt(:,2),size(x));
% plot(xt,yt,'ro-')
% hold on
% plot(xt',yt','r-')
% axis equal
% axis square

end

%%
function img = replaceEdgeValue(img, removeRange, edgeValue)

[imgH, imgW] = size(img);

%%
img(1 : removeRange, :) = edgeValue;
img(imgH - removeRange : imgH, :) = edgeValue;
img(:, 1 : removeRange) = edgeValue;
img(:, imgW - removeRange + 1 : imgW) = edgeValue;

end













