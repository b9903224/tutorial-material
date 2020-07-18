function Z = circle_matrix(image,radius, center, value, thickness) 
%   Z = circle_matrix(image,radius,value,thickness) 
%   image   :- input matrix
%   radius  :- radius of circle
%   value   :- value of circle(default value is 0)
%   thickness :- -1 for fill circle or for +ve make ring circle (default value is -1) 
%   example 1:
%   image = uint8(255*ones(512));
%   image1 = circle_matrix(image, 100);
%   image2 = circle_matrix(image, 100, 40);
%   image3 = circle_matrix(image, 100, 40, 40);
%   subplot(221),imshow(image)
%   subplot(222),imshow(image1)
%   subplot(223),imshow(image2)
%   subplot(224),imshow(image3)
%
%   example 2:
%   image = imread('lena.tif');
%   image = circle_matrix(a, 100,[210,220,150], 10);
%   imshow(image)
%
if nargin < 3
	center = [0,0];
    value = 0;
    thickness = -1;
elseif nargin < 4
    value = 0;
	thickness = -1;
	elseif nargin < 5
	thickness = -1;
end
[r,c,ch] = size(image);
[x,y] = meshgrid(-r/2+1:r/2,-c/2+1:c/2);
Z = sqrt((x - center(1)).^2 + (y - center(2)).^2);
if ch > 1
    for i = 1:3
        temp = image(:,:,i);
        if thickness < 0.01
            temp(Z < radius) = value(i);
        else
            temp((Z < (radius + 0.5*thickness)) & (Z > (radius - 0.5*thickness))) =  value(i);
        end
        image(:,:,i) = temp;
    end
else
    if thickness < 0.01
        image(Z < radius) = value;
    else
        image((Z < (radius + 0.5*thickness)) & (Z > (radius - 0.5*thickness))) =...
        value;
    end
end
Z = image;
