%%
% interp2: https://www.itread01.com/content/1546452031.html
% transImageInvPolar: https://www.mathworks.com/matlabcentral/fileexchange/48911-inverse-polar-transform-on-images?s_tid=prof_contriblnk
% transImageInvPolar_2: replace nan by zero
function imageToPolar

warning('off', 'all');
close all
format compact
rng('shuffle');

%%
imgH = 257;
imgW = 257;
img = getCircleDistImg(257,257);
img = 1 - img;

%%
% hr = (imgH-1)/2;
% hc = (imgW-1)/2;
% [X,Y] = meshgrid(-hc:hc, -hr:hr); 
% [Theta, Radius] = cart2pol(X, -Y);
% Theta(Theta < 0) = Theta(Theta < 0) + 2*pi;
% 
% [X2,Y2] = pol2cart(Theta,Radius);
% Y2 = -Y2;
% 
% figure, imshow(Theta,[])
% figure, imshow(Radius,[])

%%
in = 0;
out= 128;
cx=129;
cy=129;
phi0 = 0;
phiEnd=  2*pi;
Visualize = true;
ITrans = Utility.transImageInvPolar_2(img, cx, cy, in, out, phi0, phiEnd, Visualize);

figure, imshow(ITrans,[])

%%
ITrans_360 = imresize(ITrans, [size(ITrans,1),360]);
figure, imshow(ITrans_360)

%%
figure, imshow(img,[])

end

%%
function img = getCircleDistImg(imgH, imgW)

hr = (imgH-1)/2;
hc = (imgW-1)/2;

[x, y] = meshgrid(-hc:hc, -hr:hr); 
img = sqrt((x/hc).^2 + (y/hr).^2);

end






