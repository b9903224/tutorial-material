
% This script demonstrates the effectiveness of inverse polar transform in
% unwrapping the circular structures. The code simply loads an image and
% calls the function transImageInvPolar with appropriate parameters.
% Author: Tolga Birdal

close all;
I=double(rgb2gray(imread('sample2_crop.png')));

in=205.0;
out=676.0;
cx=802.0;
cy=550.0;
phi0 = 0;
phiEnd=  2*pi;

ITrans = transImageInvPolar(I, cx, cy, in, out, phi0, phiEnd, 1);

% You will notice a black (unmapped) area in ITrans. This corresponds to
% the missing circular part on the top of the image (the rest of the
% structure appeared outside the image)