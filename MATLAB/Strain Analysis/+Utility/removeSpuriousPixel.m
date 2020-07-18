function PixelIdx2 = removeSpuriousPixel(PixelIdx, imgH, imgW)

img_part = false(imgH, imgW);
img_part(PixelIdx) = true;
img_part_ori = img_part;
hozPixelCount = 0;
verPixelCount = 0;

%%









%%
[YAry, XAry] = ind2sub([imgH, imgW], PixelIdx);
for i = 1 : numel(YAry)
    Y = YAry(i);
    X = XAry(i);
    if Y ~= 1 && Y ~= imgH && X ~= 1 && X ~= imgW
        pixelCount = img_part_ori(Y, X-1) +...
            img_part_ori(Y, X+1) +...
            img_part_ori(Y-1, X) +...
            img_part_ori(Y+1, X);
        pixelCount2 = img_part_ori(Y, X-1) +...
            img_part_ori(Y, X+1) +...
            img_part_ori(Y-1, X) +...
            img_part_ori(Y+1, X) +...
            img_part_ori(Y-1, X-1) +...
            img_part_ori(Y-1, X+1) +...
            img_part_ori(Y+1, X-1) +...
            img_part_ori(Y+1, X+1);
        if pixelCount <= 1 && pixelCount2 > 1
            img_part(PixelIdx(i)) = false;
           
            
            
            
            
            
            
            
        end
    end
end

PixelIdx2 = find(img_part);

end


















