function img_bound = getBoundaryImg(img)

img_bound = img;
img = expandBorder(img);
img_ero = imerode(img, strel('square', 3));
img_ero = deleteBorder(img_ero);
img_bound(img_ero) = false;

end

%%
function img_new = expandBorder(img)

img_new = padarray(img, [1, 1], false);

end

%%
function img_new = deleteBorder(img)

[imgH, imgW] = size(img);
img_new = img;
img_new = img_new(2 : imgH - 1, 2 : imgW - 1);

end

























