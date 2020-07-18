function img = replaceShiftEdge(img, dy, dx, edgeValue)

[imgH, imgW] = size(img);

dy_shift_pixel = cell(abs(dy));
dx_shift_pixel = cell(abs(dx));

%%
if dy > 0
    img(1 : dy_shift_pixel, :) = edgeValue;
elseif dy < 0
    img(imgH - dy_shift_pixel + 1 : imgH, :) = edgeValue;
end

if dx > 0
    img(:, 1 : dx_shift_pixel) = edgeValue;
elseif dx < 0
    img(:, imgW - dx_shift_pixel + 1 : imgW) = edgeValue;
end

end
