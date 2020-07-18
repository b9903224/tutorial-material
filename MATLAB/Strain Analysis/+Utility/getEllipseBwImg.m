function ellipseBwImg = getEllipseBwImg(imgH, imgW, centerY, centerX, radiusY, radiusX, theta, backgroundImg)

[X, Y] = meshgrid(1 : imgW, 1 : imgH);

%%
X2 = rotateByTheta_X(X, Y, theta);
Y2 = rotateByTheta_Y(X, Y, theta);

centerX2 = rotateByTheta_X(centerX, centerY, theta);
centerY2 = rotateByTheta_Y(centerX, centerY, theta);

%%
ellipseBwImg = ((Y2 - centerY2).^2./radiusY^2 + (X2 - centerX2).^2./radiusX^2) <=1;

if ~isempty(backgroundImg)
    ellipseBwImg = ellipseBwImg | backgroundImg;
end

end

%%
function X2 = rotateByTheta_X(X, Y, theta)

X2 = X*cosd(theta) + Y*sind(theta);

end

function Y2 = rotateByTheta_Y(X, Y, theta)

Y2 = -X*sind(theta) + Y*cosd(theta);

end

